//
//  GetStartedCard.swift
//  PlantApp
//
//  Created by Doğanay Şahin on 8.02.2024.
//

import SwiftUI
import Kingfisher

struct GetStartedCard: View {
    @Environment(\.openURL) private var openURL
    var cardText : String
    var imageURL : String
    var link : String?
    var body: some View {
        VStack{
            KFImage(URL(string: imageURL))
                .placeholder{
                    RoundedRectangle(cornerRadius: 12)
                        .fill(Color.gray.opacity(0.2))
                        .frame(width: 240, height: 164)
                    
                        .overlay(alignment: .center) {
                            ProgressView().tint(Color.mainGreenColor)
                        }
                }
                .resizable()
                .scaledToFit()
                .frame(width: 240, height: 164)
                .cornerRadius(12)
                .overlay(alignment: .bottom) {
                    styledTextWithSpecialEnding(
                        cardText,
                        initialPartStyles: (15, .RubikRegular),
                        lastTwoWordsStyles: (15, .RubikMedium))
                  
                    .multilineTextAlignment(.leading)
                    .foregroundStyle(.white)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 12)
                }
        }
        .onTapGesture {
            guard let questionURLString = link else {return}
            guard let questionURL = URL(string: questionURLString) else {return}
            openURL(questionURL)
        }
    }
}

#Preview {
    GetStartedCard(cardText: "", imageURL: "")
}
extension GetStartedCard{
    func splitTextInHalf(_ text: String) -> (String, String) {
        let middleIndex = text.index(text.startIndex, offsetBy: text.count / 2)
        let firstPart = String(text.prefix(upTo: middleIndex))
        let secondPart = String(text.suffix(from: middleIndex))
        return (firstPart, secondPart)
    }
}

