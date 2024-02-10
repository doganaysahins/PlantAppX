//
//  View+Extensions.swift
//  PlantApp
//
//  Created by Doğanay Şahin on 10.02.2024.
//

import SwiftUI


extension View {
    
    /// Used to close the keyboard when clicked anywhere while the keyboard is open, or to add the return key on the keyboard.
    ///
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    /// Adds a gradient color to Text views.
    ///
    /// - Parameters:
    ///   - colors: Defines gradient colors like [.red, .blue, .green].
    ///   - startPoint: Determines the gradient start point.
    ///   - endPoint: Determines the gradient end point.
    /// - Returns: A view with the specified linear gradient
    
    func foregroundLinearGradient(
        colors: [Color],
        startPoint: UnitPoint,
        endPoint: UnitPoint) -> some View
    {
        self.overlay {
            LinearGradient(
                colors: colors,
                startPoint: startPoint,
                endPoint: endPoint
            )
            .mask(
                self
            )
        }
    }
    
    /// Rounds specific corners of a SwiftUI view with the given radius.
    ///
    /// - Parameters:
    ///   - radius: The radius of the corners.
    ///   - corners: The corners to round, default is `.allCorners`.
    /// - Returns: A view with rounded corners.
    
    func cornersRadius(radius: CGFloat, corners: UIRectCorner = .allCorners) -> some View {
        clipShape(RoundedCornersShape(radius: radius, corners: corners))
    }
    
    /// Creates a circular indicator for a tab in SwiftUI.
    ///
    /// - Parameters:
    ///   - index: The index of the tab.
    ///   - selection: The index of the currently selected tab.
    /// - Returns: A circular indicator view.
    
    func tabCircle(for index: Int, selection : Int) -> some View {
        Circle()
            .fill(selection == index ? Color.black : Color.gray)
            .frame(width: selection == index ? 10 : 6, height: selection == index ? 10 : 6)
    }
    
    /// Builds a custom text by combining segments with specified text, size, and font family.
    ///
    /// - Parameter segments: An array of tuples representing text segments, font size, and font family.
    /// - Returns: A view with combined custom text.
    
    func buildCustomText(_ segments: [(String, CGFloat, PlantFontFamily)]) -> some View {
        var combinedText: Text = Text("")
        for segment in segments {
            let (text, size, design) = segment
            combinedText = combinedText + Text(text)
                .customFont(size: size, design: design)
        }
        return combinedText
    }
    
    /// Creates a styled text with special formatting for the ending.
    ///
    /// - Parameters:
    ///   - text: The input text to be styled.
    ///   - initialPartStyles: A tuple representing font size and font family for the initial part of the text.
    ///   - lastTwoWordsStyles: A tuple representing font size and font family for the last two words of the text.
    /// - Returns: A view with styled text.
    
    func styledTextWithSpecialEnding(_ text: String, initialPartStyles : (CGFloat, PlantFontFamily), lastTwoWordsStyles : (CGFloat, PlantFontFamily)) -> some View {
        let words = text.split(separator: " ").map(String.init)
        let lastTwoWords = words.suffix(2).joined(separator: " ")
        let initialPart = words.dropLast(2).joined(separator: " ")
        return buildCustomText([
            (initialPart, initialPartStyles.0 , initialPartStyles.1),
            (" " + lastTwoWords, lastTwoWordsStyles.0 , lastTwoWordsStyles.1)
        ])
        
    }
}

extension Text {
    
    /// Applies a custom font to the text with specified size and design.
    ///
    /// - Parameters:
    ///   - size: The size of the font.
    ///   - design: The custom font family design.
    /// - Returns: A modified Text view with the custom font applied.
    ///
    func customFont(size: CGFloat, design: PlantFontFamily) -> Text {
        self.font(.custom(design.rawValue, size: size))
        
    }
}
