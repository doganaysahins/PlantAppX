//
//  CustomTextFieldModifier.swift
//  PlantApp
//
//  Created by Doğanay Şahin on 7.02.2024.
//

import SwiftUI

/**
 A custom SwiftUI TextField style for Plant App.

 This style provides customization options such as head icon, border color, corner radius,
 and the ability to show a placeholder with specific styling.

 - Parameters:
    - headIcon: The name of the image for the head icon.
    - borderColor: The color of the text field border.
    - borderRadius: The corner radius of the text field.
    - headIconColor: The color of the head icon.
    - showPlaceHolder: A flag indicating whether to show the placeholder.
    - placeholder: The text to be displayed as a placeholder.

 Example usage:

 ```swift
 TextField("Username", text: $username)
     .textFieldStyle(PlantApptFieldStyle(
         headIcon: "person",
         borderColor: .blue,
         borderRadius: 10,
         headIconColor: .gray,
         showPlaceHolder: true,
         placeholder: "Enter your username"
     ))

**/

struct PlantApptFieldStyle: SwiftUI.TextFieldStyle {
    var headIcon : String
    var borderColor : Color
    var borderRadius : CGFloat
    var headIconColor : Color
    var showPlaceHolder: Bool
    var placeholder: String
    
    init(headIcon: String, borderColor : Color, borderRadius : CGFloat, headIconColor : Color, showPlaceHolder : Bool, placeholder : String) {
        self.headIcon = headIcon
        self.borderColor = borderColor
        self.borderRadius = borderRadius
        self.headIconColor = headIconColor
        self.showPlaceHolder = showPlaceHolder
        self.placeholder = placeholder
        
        
    }
    
    func _body(configuration: TextField<Self._Label>) -> some View {
        ZStack(alignment: .leading) {
            if showPlaceHolder{
                Text(placeholder)
                    .customFont(size: 15.5, design: .RubikRegular)
                    .foregroundColor(.gray)
                    .padding(EdgeInsets(top: 14, leading: 48, bottom: 14, trailing: 8))
                    .kerning(0.07)
                    
            }
            configuration
                .padding(EdgeInsets(top: 14, leading: 42, bottom: 14, trailing: 8))
            
                .overlay(
                    RoundedRectangle(cornerRadius: borderRadius)
                        .stroke(borderColor, lineWidth: 0.2)
                )
            HStack{
                Image(headIcon)
                    .renderingMode(.template)
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(headIconColor)
                    .padding(.leading, 12)
                Spacer()
            }
        }
        .background(Color.white.opacity(0.9).cornerRadius(8))
        .frame(maxWidth: .infinity)
        .tint(.mainTextColor)
    }
}
