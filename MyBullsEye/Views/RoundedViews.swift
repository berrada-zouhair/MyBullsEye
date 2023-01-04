//
//  RoundedViews.swift
//  MyBullsEye
//
//  Created by BERRADA on 27/10/2021.
//

import SwiftUI

struct RoundedImageViewStrocked: View {
    let systemImage: String
    var body: some View {
        Image(systemName: systemImage)
            .frame(width: 56, height: 56)
            .font(.title2)
            .foregroundColor(Color("TextColor"))
            .overlay(
                Circle()
                    .strokeBorder(Color("ButtonStockColor"), lineWidth: Constants.UI.strockWidth)
            )
    }
}

struct RoundedImageViewFilled: View {
    let systemImage: String
    var body: some View {
        Image(systemName: systemImage)
            .frame(width: 56, height: 56)
            .font(.title2)
            .foregroundColor(Color("ButtonFilledTextColor"))
            .background(
                Circle().fill(Color("ButtonFilledBackgroundColor"))
            )
    }
}

struct RoundedTextViewStrocked: View {
    let text: String
    var body: some View {
        Text(text)
            .fontWeight(.medium)
            .frame(width: 56, height: 56)
            .font(.title2)
            .foregroundColor(Color("TextColor"))
            .overlay(
                RoundedRectangle(cornerRadius: Constants.UI.cornerRaduis)
                    .strokeBorder(Color("ButtonStockColor"), lineWidth: Constants.UI.strockWidth)
            )
    }
}

struct RoundedViews_Previews: PreviewProvider {
    
    struct StatefulPreviewWrapper: View {
        var body: some View {
            VStack {
                RoundedImageViewStrocked(systemImage: "arrow.counterclockwise")
                RoundedImageViewStrocked(systemImage: "list.bullet")
                RoundedTextViewStrocked(text: "3")
                RoundedImageViewFilled(systemImage: "arrow.counterclockwise")
            }
        }
    }
    
    static var previews: some View {
        StatefulPreviewWrapper()
        StatefulPreviewWrapper()
            .preferredColorScheme(.dark)
    }
}
