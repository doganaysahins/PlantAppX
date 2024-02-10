//
//  TabbarView.swift
//  PlantApp
//
//  Created by Doğanay Şahin on 7.02.2024.
//

import SwiftUI

struct TabItem : Hashable{
    var pageIndex : Pages
    var tabImageName : String
    var tabLabel : String?
    var isOffsetButton : Bool
    
}

enum Pages{
    case home
    case diagnose
    case identifiy
    case myGarden
    case profile
}

struct TabbarView: View {
    @ObservedObject var questionViewModel : QuestionsViewModel
    @ObservedObject var categoriesViewModel : CategoriesViewModel
    @State var selectedIndex : Pages = .home
    let tabbarImageNames  : [TabItem] = [
        TabItem(pageIndex: .home, tabImageName: "home-icon", tabLabel: "Home", isOffsetButton: false),
        TabItem(pageIndex: .diagnose, tabImageName: "diagnose-icon", tabLabel: "Diagnose", isOffsetButton: false),
        TabItem(pageIndex: .identifiy, tabImageName: "identify-icon", isOffsetButton: true),
        TabItem(pageIndex: .myGarden, tabImageName: "garden-icon", tabLabel: "My Garden", isOffsetButton: false),
        TabItem(pageIndex: .profile, tabImageName: "profile-icon", tabLabel: "Profile", isOffsetButton: false)
    ]
    
    
    
    var body: some View {
        
        VStack{
            
            
            switch selectedIndex {
            case .home:
                HomePage(questionViewModel: questionViewModel, categoriesViewModel: categoriesViewModel)
            case .diagnose:
                DiagnosePage()
            case .identifiy:
                IdentifiyPage()
            case .myGarden:
                MyGardenPage()
            case .profile:
                ProfilePage()
            }
            
            Divider()
            HStack(spacing : 0){
                ForEach(tabbarImageNames, id: \.self) { item in
                    TabButtonView(selectedIndex: selectedIndex, tabbarItem: item, action: {
                        selectedIndex = item.pageIndex
                    })
                    
                }
            }
            
            .frame(maxWidth: .infinity)
            .background(Color.bottomTabbarBackground)
            
            
        }
        
        
        
    }
}

#Preview {
    TabbarView(questionViewModel: QuestionsViewModel(), categoriesViewModel: CategoriesViewModel())
}
