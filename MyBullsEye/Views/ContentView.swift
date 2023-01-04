//
//  ContentView.swift
//  MyBullsEye
//
//  Created by BERRADA on 26/10/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showLeaderboard = false
    @State private var showAlert = false
    @State private var game = Game()
    @State private var slideValue: Double = 50
    @State private var gamePoints: Int = 0
    @State private var gameShots = GameShots()
    
    var body: some View {
        if !showLeaderboard {
            ZStack {
                BackgroundView(game: $game, showLeaderboard: $showLeaderboard)
                .opacity(showAlert ? 0.5 : 1)
            HStack {
                Text("1")
                    .bold()
                    .frame(width: 30, height: 10, alignment: .center)
                Slider(value: $slideValue, in: 1...100)
                Text("100")
                    .bold()
                    .frame(width: 30, height: 10)
            }
            .padding(.horizontal)
            .opacity(showAlert ? 0.5 : 1)
            if !showAlert {
                VStack {
                    VStack {
                        Text("🎯🎯🎯\nPUT THE BULLSEYE AS CLOSE AS YOU CAN")
                            .bold()
                            .kerning(2.0)
                            .multilineTextAlignment(.center)
                            .font(.footnote)
                        Text("\(game.target)")
                            .kerning(-1.0)
                            .font(.largeTitle)
                            .fontWeight(.black)
                    }
                    .padding(.bottom, 70.0)
                    Button(action: {
                        gamePoints = game.points(Int(slideValue))
                        gameShots.all.append(GameShot(score: gamePoints, round: game.round, date: Date()))
                        withAnimation {
                            showAlert = true
                        }
                    }) {
                        Text("Hit Me")
                            .bold()
                            .font(.title3)
                            .textCase(.uppercase)
                    }
                    .padding(20)
                    .background(
                        ZStack {
                            Color.blue
                            LinearGradient(colors: [.white.opacity(0.3), .clear], startPoint: .top, endPoint: .bottom)
                        }
                    )
                    .foregroundColor(.white)
                    .cornerRadius(Constants.UI.cornerRaduis)
                    .overlay(
                        RoundedRectangle(cornerRadius: Constants.UI.cornerRaduis)
                            .strokeBorder(Color("ButtonStockColor"), lineWidth: Constants.UI.strockWidth)
                    )
                }
                .opacity(showAlert ? 0.5 : 1)
                .transition(.scale)
            }
            if showAlert {
                AlertContentView(sliderValue: Int(slideValue), pointsScored: gamePoints, buttonAction: {
                    withAnimation {
                        showAlert = false
                    }
                    game.startNewRound(points: gamePoints)
                }).transition(.slide)
            }
        }
        } else {
            LeaderbordView(gameShots: $gameShots, showLeaderboard: $showLeaderboard)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .preferredColorScheme(.dark)
//            .frame(width: 568, height: 320)
//            .previewInterfaceOrientation(.portrait)
    }
}
