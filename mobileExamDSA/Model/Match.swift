//
//  Match.swift
//  mobileExamDSA
//
//  Created by Diego Salazar Arp on 12-09-19.
//  Copyright © 2019 Diego Salazar Arp. All rights reserved.
//

import Foundation

struct Matches: Codable {
    let matchs: [Matchs]
    struct Matchs: Codable {
        let local: Local
        let away: Away
        let local_goals: Double
        let away_goals: Double
        let stadium: Stadium
        let championship: Championship
        let scorer: String
    }
}
struct Local: Codable {
    let name: String
    let image: String
}
struct Away: Codable {
    let name: String
    let image: String
}
struct Stadium: Codable {
    let name: String
}
struct Championship: Codable {
    let name: String
}
