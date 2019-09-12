//
//  Webservice.swift
//  mobileExamDSA
//
//  Created by Diego Salazar Arp on 12-09-19.
//  Copyright © 2019 Diego Salazar Arp. All rights reserved.
//

import Foundation

class Webservice {

    func getAllMatches(completion: @escaping ([Matches.Matchs]?) -> ()) {

        guard let url = URL(string: "http://futbol.funx.io/api/v2/u-chile/home/match/")
            else {
                fatalError("URL is not correct!")
        }
        URLSession.shared.dataTask(with: url) { data, _, _ in

            let matchs = try! JSONDecoder().decode([Matches.Matchs].self, from: data!)
            DispatchQueue.main.async {
                completion(matchs)
            }
        }.resume()
    }

}
