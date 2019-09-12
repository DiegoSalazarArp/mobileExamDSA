//
//  MatchViewModel.swift
//  mobileExamDSA
//
//  Created by Diego Salazar Arp on 12-09-19.
//  Copyright © 2019 Diego Salazar Arp. All rights reserved.
//

import Foundation
import EventKit

class MatchListViewModel: ObservableObject {

    @Published var matches = [MatchViewModel]()
    let store = EKEventStore()

    init() {
        fetchMatch()
    }

    func fetchMatch() {
        Webservice().getAllMatches { matches in

            if let matches = matches {
                self.matches = matches.map(MatchViewModel.init)
            }
        }
    }
    
    func createEventinTheCalendar(with title:String) {
        
        store.requestAccess(to: .event) { (success, error) in
            if  error == nil {
                let event = EKEvent.init(eventStore: self.store)
                event.title = title
                event.calendar = self.store.defaultCalendarForNewEvents
                event.startDate = Date()
                event.endDate = Date()
                
                let alarm = EKAlarm.init(absoluteDate: Date.init(timeInterval: -3600, since: event.startDate))
                event.addAlarm(alarm)
                
                do {
                    try self.store.save(event, span: .thisEvent)
                   
                } catch let error as NSError {
                    print("failed to save event with error : \(error)")
                }

            } else {
               
                print("error = \(String(describing: error?.localizedDescription))")
            }
        }
    }

}


class MatchViewModel {

    let id = UUID()

    var match: Matches.Matchs

    init(match: (Matches.Matchs)) {
        self.match = match
    }


    var championship: String {
        return self.match.championship.name
    }

    var local_Name: String {
        return self.match.local.name
    }

    var local_Image: String  {
        return self.match.local.image
    }
    
    var away_Name: String {
        return self.match.away.name
    }
    
    var away_Image: String {
        return self.match.away.image
    }

    var local_goals: Double {
        return self.match.local_goals
    }
    
    var away_goals: Double {
        return self.match.away_goals
    }

    var stadium_Name: String {
        return self.match.stadium.name
    }
    var scorer: String {
        return self.match.scorer
    }

}
