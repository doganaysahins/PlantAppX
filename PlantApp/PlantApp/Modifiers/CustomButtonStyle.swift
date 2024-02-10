//
//  CustomButtonStyle.swift
//  PlantApp
//
//  Created by Doğanay Şahin on 10.02.2024.
//

import SwiftUI

/**
 A custom SwiftUI button style for Plant App.

 This button style provides customization options such as button color, text color, gradient color, and corner radius.

 - Parameters:
    - buttonColor: The background color of the button.
    - textColor: The color of the button text.
    - gradientColor: Optional linear gradient to be applied to the button background.
    - cornerRadius: The corner radius of the button.

 Example usage:

 ```swift
 Button("Tap me") {
     // Action to be performed when the button is tapped
 }
 .buttonStyle(PlantAppButtonStyle(buttonColor: .blue, textColor: .white, gradientColor: LinearGradient(gradient: ...), cornerRadius: 12))
 
 **/

struct PlantAppButtonStyle: ButtonStyle {
    var buttonColor: Color
    var gradientColor: LinearGradient?
    var textColor : Color
    var cornerRadius : CGFloat
    
    init(buttonColor: Color = .blue, textColor: Color = .white, gradientColor : LinearGradient? = nil, cornerRadius : CGFloat = 12) {
        self.buttonColor = buttonColor
        self.textColor = textColor
        self.gradientColor = gradientColor
        self.cornerRadius = cornerRadius
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .frame(height: 56)
            .background(
                Group{
                    if let gradient = gradientColor{
                        buttonColor
                            .overlay(gradient)
                    }else{
                        buttonColor
                    }
                }
            )
            .cornerRadius(cornerRadius)
            .scaleEffect(configuration.isPressed ? 0.99 : 1.0)
            
            
    }
}
