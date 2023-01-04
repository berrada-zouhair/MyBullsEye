//
//  GameShot.swift
//  MyBullsEye
//
//  Created by BERRADA on 28/10/2021.
//

import Foundation

struct GameShot: Identifiable {
    let id = UUID()
    let score: Int
    let round: Int
    let date: Date
}

struct GameShots {
    var all: [GameShot] = []
}
