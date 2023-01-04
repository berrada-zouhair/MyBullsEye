//
//  LeaderbordView.swift
//  MyBullsEye
//
//  Created by BERRADA on 28/10/2021.
//

import SwiftUI

struct LeaderbordView: View {
    @Binding var gameShots: GameShots
    @Binding var showLeaderboard: Bool
    
    var body: some View {
        VStack(spacing: 15) {
            HStack {
                HStack {
                    Text("LEADERBOARD")
                        .bold()
                        .font(.title2)
                    Spacer()
                    Button(action: {
                        withAnimation {
                            showLeaderboard = false
                        }
                    }) {
                        RoundedImageViewFilled(systemImage: "xmark")
                    }
                }
            }
            .padding([.leading, .bottom, .trailing])
            LeaderbordLabelRowView()
            ScrollView {
                ForEach(gameShots.all) {
                    LeaderbordRowView(round: $0.round, score: $0.score, date: $0.date)
                }
            }
//            LeaderbordRowView(round: 1, score: 10, date: Date())
//            LeaderbordRowView(round: 1, score: 10, date: Date())
//            LeaderbordRowView(round: 1, score: 10, date: Date())
        }
        .padding()
        .frame(width: 350)
        
    }
}

struct LeaderbordLabelRowView: View {
    var body: some View {
        HStack {
            Text("Round")
                .foregroundColor(Color("TextColor"))
                .frame(width: 50, height: 50)
            Spacer()
            Text("Score")
                .foregroundColor(Color("TextColor"))
                .bold()
            Spacer()
            Text("Time")
                .bold()
                .foregroundColor(Color("TextColor"))
                .padding(.trailing)
        }
        .frame(width: 300, height: 50)
    }
}

struct LeaderbordRowView: View {
    let round: Int
    let score: Int
    let date: Date
    
    var body: some View {
        HStack {
            Text(String(round))
                .bold()
                .font(.title3)
                .foregroundColor(Color("TextColor"))
                .frame(width: 50, height: 50)
                .overlay(
                    Circle()
                        .strokeBorder(lineWidth: 2)
                        .foregroundColor(Color("LeaderbordRowColor"))
                )
            Spacer()
            Text(String(score))
                .foregroundColor(Color("TextColor"))
                .bold()
                .font(.title3)
            Spacer()
            Text(date, style: .time)
                .bold()
                .font(.headline)
                .foregroundColor(Color("TextColor"))
                .padding(.trailing)
        }
        .frame(width: 300, height: 50)
        .overlay(
            RoundedRectangle(cornerRadius: .infinity)
                .strokeBorder(lineWidth: Constants.UI.strockWidth)
                .foregroundColor(Color("LeaderbordRowColor"))
        )
    }
}

struct LeaderbordView_Previews: PreviewProvider {
    
    struct StatefulPreviewWrapper: View {
        @State var gameShots: GameShots
        init() {
            gameShots = GameShots()
            gameShots.all.append(GameShot(score: 13, round: 1, date: Date()))
            gameShots.all.append(GameShot(score: 37, round: 2, date: Date()))
            gameShots.all.append(GameShot(score: 71, round: 3, date: Date()))
            gameShots.all.append(GameShot(score: 42, round: 4, date: Date()))
            gameShots.all.append(GameShot(score: 200, round: 5, date: Date()))
        }
        var body: some View {
            LeaderbordView(gameShots: $gameShots, showLeaderboard: .constant(false))
        }
    }
    
    static var previews: some View {
        StatefulPreviewWrapper()
        StatefulPreviewWrapper()
            .preferredColorScheme(.dark)
    }
}
