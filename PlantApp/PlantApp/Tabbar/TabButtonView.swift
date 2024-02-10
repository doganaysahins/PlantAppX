//
//  TabButtonView.swift
//  PlantApp
//
//  Created by Doğanay Şahin on 7.02.2024.
//

import SwiftUI

struct TabButtonView: View {
    var selectedIndex : Pages
    var tabbarItem : TabItem
    var action : () -> ()
    var body: some View {
        Button(action: {
            
            action()
        },
               label: {
            VStack(spacing : 8){
                if !tabbarItem.isOffsetButton{
                    Image(tabbarItem.tabImageName)
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                }else{
                    Image(tabbarItem.tabImageName)
                        .renderingMode(.template)
                        .resizable()
                        .frame(width: 32, height: 32)
                        .scaledToFit()
                        .foregroundColor(.white)
                        .background(Circle().fill(
                            Color.mainGreenColor.opacity(0.9)
                        )
                            .shadow(color: .white.opacity(0.5), radius: 2)
                            .frame(width: 68, height: 68)
                            .overlay(
                                Circle()
                                    .stroke(Color.mainGreenColor1, lineWidth: 4)
                            )
                        )
                        .offset(y: -25)
                }
                
                if let tabLabel = tabbarItem.tabLabel{
                    Text(tabLabel)
                        .customFont(size: 10, design: .RubikRegular)
                        .foregroundStyle(Color.tabbarIconMainColor)
                    
                }
            }
            .frame(width: 74, height: 49)
            .padding(.vertical, 4)
        })
        .tint(selectedIndex == tabbarItem.pageIndex ? Color.mainGreenColor : Color.tabbarIconMainColor)
    }
}

//#Preview {
//    TabButtonView()
//}
