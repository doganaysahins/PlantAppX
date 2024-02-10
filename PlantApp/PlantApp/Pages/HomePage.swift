//
//  Home.swift
//  PlantApp
//
//  Created by Doğanay Şahin on 7.02.2024.
//

import SwiftUI

struct HomePage: View {
    @ObservedObject var questionViewModel : QuestionsViewModel
    @ObservedObject var categoriesViewModel : CategoriesViewModel
    @State var searchText = ""
    @State var showPaywall = false
    var columns: [GridItem] = [GridItem(.flexible(minimum: 152, maximum: 158)),GridItem(.flexible(minimum: 152, maximum: 158))]
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(alignment : .leading){
                Text("Hi, plant lover!")
                    .customFont(size: 16, design: .RubikRegular)
                    .foregroundStyle(Color.mainTextColor)
                    .padding(.bottom, 4)
                    .padding(.top, 12)
                Text("Good Afternoon! 🌤️")
                    .customFont(size: 24, design: .RubikSemibold)
                    .foregroundStyle(Color.mainTextColor)
                    .padding(.bottom, 12)
                TextField("", text: $categoriesViewModel.searchText, onCommit: hideKeyboard)
                    .textFieldStyle(
                        PlantApptFieldStyle(
                            headIcon: "search-icon",
                            borderColor: .placeholderColor,
                            borderRadius: 12,
                            headIconColor: .placeholderColor,
                            showPlaceHolder: categoriesViewModel.searchText.isEmpty,
                            placeholder: "Search for plants"))
                    .padding(.bottom, 20)
            }
            .padding(.top, 36)
            .padding(.horizontal, 20)
            .background(content: {
                Image("header-background")
                    .resizable()
                    .ignoresSafeArea()
            })
            VStack{
                PremiumButton {
                    showPaywall.toggle()
                }
                VStack{
                    HStack{
                        Text("Get Started")
                            .customFont(size: 18, design: .RubikSemibold)
                            .foregroundStyle(Color.mainTextColor)
                           
                        Spacer()
                    }.padding(.leading, 20)
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            ForEach(questionViewModel.questions, id : \.id){ question in
                                GetStartedCard(cardText: question.title, imageURL: question.image_uri, link: question.uri)
                                
                            }
                        }.padding(.leading, 20)
                    }
                }
                
                LazyVGrid(columns : columns, spacing: 12){
                    ForEach(categoriesViewModel.searchResults, id : \.id){ category in
                        CategoryCard(categoryImage: category.image.url, categoryName: category.title)
                    }
                    Spacer()
                }
                .padding(.top, 12)
            }
        }
        .ignoresSafeArea()
        .onTapGesture {
            self.hideKeyboard()
        }
        .fullScreenCover(isPresented: $showPaywall, content: {
            PaywallPage(onboarded: OnboardingController(), paywallState: .fullScreen)
        })
    }
}

#Preview {
    HomePage(questionViewModel: QuestionsViewModel(), categoriesViewModel: CategoriesViewModel())
}


