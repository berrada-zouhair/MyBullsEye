//
//  GameTests.swift
//  MyBullsEyeTests
//
//  Created by BERRADA on 26/10/2021.
//

import XCTest
@testable import MyBullsEye

class GameTests: XCTestCase {
    
    var game: Game!

    override func setUpWithError() throws {
        game = Game()
    }

    override func tearDownWithError() throws {
        game = nil
    }

    func test_game_points_should_get_200_when_target_equal_guess_value() throws {
        game.target = 50
        let guess = 50
        XCTAssertEqual(game.points(guess), 200)
    }
    
    
    func test_game_points_should_get_95_when_target_equal_55_and_guess_equal_50() throws {
        game.target = 55
        let guess = 50
        XCTAssertEqual(game.points(guess), 95)
    }
    
    func test_game_points_should_get_75_when_target_equal_75_and_guess_equal_50() throws {
        game.target = 75
        let guess = 50
        XCTAssertEqual(game.points(guess), 75)
    }
    
    func test_game_points_should_get_10_when_target_equal_10_and_guess_equal_100() throws {
        game.target = 10
        let guess = 100
        XCTAssertEqual(game.points(guess), 10)
    }
    
    func test_game_points_should_get_50_points_bonus_when_difference_target_and_guess_is_less_than_or_equal_2() throws {
        game.target = 50
        var guess = 52
        XCTAssertEqual(game.points(guess), 98 + 50)
        
        game.target = 52
        guess = 50
        XCTAssertEqual(game.points(guess), 98 + 50)
    }
    
    func test_start_new_round_should_increment_round_and_change_target_and_add_points_to_score() {
        var points = game.points(Int.random(in: 1...100))
        var target = game.target

        game.startNewRound(points: points)
        XCTAssertEqual(game.score, points)
        XCTAssertEqual(game.round, 2)
        XCTAssertNotEqual(target, game.target)
        
        let oldScore = game.score
        points = game.points(Int.random(in: 1...100))
        target = game.target
        
        game.startNewRound(points: points)
        XCTAssertEqual(game.score, oldScore + points)
        XCTAssertEqual(game.round, 3)
        XCTAssertNotEqual(target, game.target)
    }
    
    func test_restart_game_should_reinit_games_properties() throws {
        game.startNewRound(points: 17)
        let oldGameTarget = game.target
        game.restart()
        XCTAssertEqual(game.round, 1)
        XCTAssertEqual(game.score, 0)
        XCTAssertNotEqual(game.target, oldGameTarget)
    }

}
