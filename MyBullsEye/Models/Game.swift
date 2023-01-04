//
//  Game.swift
//  MyBullsEye
//
//  Created by BERRADA on 26/10/2021.
//

import Foundation

struct Game {
    var target = Int.random(in: 1...100)
    var score = 0
    var round = 1
    
    func points(_ value: Int) -> Int {
        var bonus = 0
        if value == target {
            bonus = 100
        } else if abs(target - value) <= 2 {
            bonus = 50
        }
        return bonus + 100 - abs(target - value)
    }
    
    mutating func startNewRound(points: Int) {
        round += 1
        score += points
        target = generateRandomNumberDifferentThanTarget()
    }
    
    mutating func restart() {
        round = 1
        score = 0
        target = generateRandomNumberDifferentThanTarget()
    }
    
    mutating private func generateRandomNumberDifferentThanTarget() -> Int {
        var random: Int
        repeat {
            random = Int.random(in: 1...100)
        } while random == target
        return random
    }
}
