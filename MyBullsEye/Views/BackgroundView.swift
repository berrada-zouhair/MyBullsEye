//
//  BackgroundView.swift
//  MyBullsEye
//
//  Created by BERRADA on 27/10/2021.
//

import SwiftUI

struct BackgroundView: View {
    @Binding var game: Game
    @Binding var showLeaderboard: Bool
    
    var body: some View {
        VStack {
            TopView(game: $game, showLeaderboard: $showLeaderboard)
            Spacer()
            BottomView(game: $game)
        }
        .edgesIgnoringSafeArea(.all)
        .padding()
        .background(
            RingsView()
        )
//        .background(Color("BackGroundColor"))
    }
}

struct TopView: View {
    @Binding var game: Game
    @Binding var showLeaderboard: Bool
    
    var body: some View {
        HStack {
            Button(action: {game.restart()}) {
                RoundedImageViewStrocked(systemImage: "arrow.counterclockwise")
            }
            Spacer()
            Button(action: {
                withAnimation {
                    showLeaderboard = true                    
                }
            }) {
                RoundedImageViewStrocked(systemImage: "list.bullet")
            }
        }
    }
}

struct BottomView: View {
    @Binding var game: Game
    
    var body: some View {
        HStack {
            VStack {
                Text("Score")
                    .font(.caption)
                    .padding(.bottom, -5.0)
                RoundedTextViewStrocked(text: String(game.score))
            }
            Spacer()
            VStack {
                Text("Round")
                    .font(.caption)
                    .padding(.bottom, -5.0)
                RoundedTextViewStrocked(text: String(game.round))
            }
        }
    }
}

struct RingsView: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        ZStack {
            Color("BackGroundColor")
                .edgesIgnoringSafeArea(.all)
            ForEach(1..<5) { [opacity = colorScheme == .light ? 0.3 : 0.1] ring in
                let ringSize = CGFloat(90 * ring)
                Circle()
                    .stroke(lineWidth: 12)
                    .fill(
                        RadialGradient(colors: [Color("RingsColor")
                                                    .opacity(opacity * 0.6),
                                                Color("RingsColor")
                                                    .opacity(0)],
                                       center: .center, startRadius: CGFloat(100), endRadius: CGFloat(300))
                    )
                    .frame(width: ringSize, height: ringSize)
            }
        }
    }
}


struct BackgroundView_Previews: PreviewProvider {
    
    struct StatefulPreviewWrapper: View {
        @State var game = Game()
        var body: some View {
            BackgroundView(game: $game, showLeaderboard: .constant(false))
        }
    }
    
    static var previews: some View {
        StatefulPreviewWrapper()
    }
}
