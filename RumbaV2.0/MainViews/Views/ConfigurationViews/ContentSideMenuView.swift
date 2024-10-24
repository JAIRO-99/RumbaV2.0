//
//  ContentSideMenuView.swift
//  RumbaV2.0
//
//  Created by Jairo Laurente Celis on 27/09/24.
//

import SwiftUI

struct ContentSideMenuView: View {
    @Binding var isShowing: Bool
    @Binding var selectedTab: Int
    @State private var selectedOption: SideMenuOptionModel?
    @State var darkMode: Bool
    var image: String
    
    var body: some View {
        ZStack{
            if isShowing {
                Rectangle()
                    .opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        isShowing.toggle()
                    }
                HStack {
                    VStack(alignment: .leading) {
                        
                        HeaderView()
                        
                        Divider()
                        
                        ForEach(SideMenuOptionModel.allCases) { option in
                            RowItemView(option: option, selectedOption: $selectedOption)
                                .onTapGesture {
                                    onOptionTapped(option)
                                }
                        }
                        Spacer()
                    }
                    .padding()
                    .frame(width: 270, alignment: .leading)
                    .background(Color.white)
                    Spacer()
                    
                }
                .transition(.move(edge: .leading))
            }
        }
        .animation(.easeInOut, value: isShowing)
    
    }
    private func onOptionTapped(_ option: SideMenuOptionModel) {
        selectedOption = option
        selectedTab = option.rawValue
        isShowing = false
        
    }
}

#Preview {
    ContentSideMenuView(isShowing: .constant(true), selectedTab: .constant(1), darkMode: false, image: "")
}

enum SideMenuOptionModel: Int, CaseIterable,Identifiable {
    case perfil
    case pro
    case findUs
    case rateApp
    
    var title: String{
        switch self {
        case .perfil:
            return "Home"
        case .pro:
            return "Pro"
        case .findUs:
            return "Encuentranos"
        case .rateApp:
            return "Calificar la app"
        }
    }
    
    var imageName: String {
        switch self {
        case .perfil:
            return "person"
        case .pro:
            return "star"
        case .findUs:
            return "house"
        case .rateApp:
            return "heart"
        }
    }
    var id: Int { return self.rawValue}
}
