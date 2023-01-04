//
//  AlertContentView.swift
//  MyBullsEye
//
//  Created by BERRADA on 28/10/2021.
//

import SwiftUI

struct AlertContentView: View {
    let sliderValue: Int
    let pointsScored: Int
    let buttonAction: () -> Void
    
    var body: some View {
        VStack {
            Text("The silder value is".uppercased())
                .kerning(1)
                .fontWeight(.medium)
            Text("\(sliderValue)")
                .bold()
                .font(.title)
                .padding(.vertical, 1.0)
            Text("You scored \(pointsScored) points\n🎉🎉🎉")
                .font(.subheadline)
                .fontWeight(.semibold)
                .lineSpacing(10)
                .multilineTextAlignment(.center)
            Button(action: {
                buttonAction()
            }) {
                ButtonTextView()
            }
        }
        .frame(maxWidth: 300)
        .padding()
        .background(Color("BackGroundColor"))
        .cornerRadius(21)
        .shadow(radius: 10, x: 0, y: 0)
    }
}

struct ButtonTextView: View {
    var body: some View {
        Text("Start New Round")
            .bold()
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.accentColor)
            .foregroundColor(.white)
            .cornerRadius(12)
    }
}

struct AlertContentView_Previews: PreviewProvider {
    
    struct StatefulPreviewWrapper: View {
        let sliderValue = 70
        let pointsScored = 76
        
        var body: some View {
            AlertContentView(sliderValue: sliderValue, pointsScored: pointsScored, buttonAction: {})
            ButtonTextView()
                .padding()
        }
    }
    
    static var previews: some View {
        StatefulPreviewWrapper()
    }
}
