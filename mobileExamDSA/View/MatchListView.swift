//
//  MatchListView.swift
//  mobileExamDSA
//
//  Created by Diego Salazar Arp on 12-09-19.
//  Copyright © 2019 Diego Salazar Arp. All rights reserved.
//

import SwiftUI

struct MatchListView: View {
    
    let matches: [MatchViewModel]
    
    @ObservedObject private var matchListVM = MatchListViewModel()
    
    init(matches: [MatchViewModel]) {
        self.matches = matches
    }
    
    var body: some View {
        List {
            ForEach(self.matches, id:\.id) { matchs in
                
                VStack(alignment: .center) {
                    
                    Text(matchs.championship.uppercased())
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.top, 20)
                    Text(matchs.stadium_Name)
                    
                    HStack(alignment: .center) {
                        VStack(alignment: .center){
                            WebImage(imageURL: URL(string: matchs.local_Image))
                                .shadow(radius: 10)
                                
                            Text(matchs.local_Name)
                                .font(.callout)
                                .fontWeight(.bold)
                                .multilineTextAlignment(.center)
                            .padding(.top, 10)
                                
                            
                        }.frame(width: 100, height: 150)
                        Spacer()
                        VStack{
                            Text(matchs.scorer)
                                .font(.largeTitle)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color(.init(red: 148/255, green: 39/255, blue: 35/255, alpha: 1.0)))
                        }
                        
                        Spacer()
                        VStack(alignment: .center){
                            WebImage(imageURL: URL(string:matchs.away_Image))
                            .shadow(radius: 10)

                            

                            Text(matchs.away_Name)
                                .font(.callout)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                            .padding(.top, 10)
                        }.frame(width: 100, height: 150)
                    }.padding()
                    
                    VStack{
                        Button(action: self.calendar) {
                            Image(systemName: "calendar")
                            Text("Recordar")
                        }
                    }
                    
                }.foregroundColor(Color(.init(red: 34/255, green: 36/255, blue: 114/255, alpha: 1.0)))

            }
        }
    }
    private func calendar(){
        self.matchListVM.createEventinTheCalendar(with: "Example")
        
    }
}

struct MatchListView_Previews: PreviewProvider {
    static var previews: some View {
        MatchListView(matches: [MatchViewModel(match: Matches.Matchs(local: Local(name: "Universidad d", image: "u"), away: Away(name: "Coquimbo Unido", image: "cu"), local_goals: 3, away_goals: 0, stadium: Stadium(name: "Nacional"), championship: Championship(name: "Torneo Apertura"), scorer: "3 - 0"))])
    }
}
