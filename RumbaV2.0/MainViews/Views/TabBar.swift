//
//  TabBar.swift
//  RumbaV2.0
//
//  Created by Jairo Laurente Celis on 17/09/24.
//

import SwiftUI
import Combine

struct TabBar: View {
    
    let tabIcons = ["inicio", "library", "pro"]
    let tabTitles = ["Inicio", "Mi librería", "Pro"]
    @EnvironmentObject var tabBarViewModel: TabBarViewModel
    @State private var keyboardIsPresented: Bool = false
    
    var body: some View {
        ZStack {
            Color("negro")
                .edgesIgnoringSafeArea(.all)
            VStack {
                ZStack{
                    switch tabBarViewModel.indexSelectedIcons {
                    case 0:
                        HomeViews()
                    case 1:
                        LibraryView()
                    default:
                        PurchaseView()
                    }
                }
                if !keyboardIsPresented { // Mostrar el TabBar solo si el teclado no está presente
                    HStack {
                        ForEach(0..<3) { icon in
                            Spacer()
                            Button {
                                self.tabBarViewModel.indexSelectedIcons = icon
                            } label: {
                                if tabBarViewModel.indexSelectedIcons == icon {
                                    HStack {
                                        HStack{
                                            Image("\(tabIcons[icon])")
                                                .renderingMode(.template)
                                                .resizable()
                                                .frame(width: 30, height: 30)
                                                .foregroundColor(Color("celeste"))
                                            
                                            Text(tabTitles[icon])
                                                .foregroundColor(Color("celeste"))
                                        }
                                        .padding(.horizontal,30)
                                        .padding(.vertical,10)
                                        .background(Color.black)
                                        .cornerRadius(30)
                                    }
                                    .padding(7)
                                } else {
                                    Image(tabIcons[icon])
                                        .resizable()
                                        .frame(width: 30, height: 30)
                                        .padding(.horizontal)
                                }
                            }
                            Spacer()
                        }
                    }
                    .background(Color("gris"))
                    .cornerRadius(40)
                    .padding()
                }
            }
        }
        .onReceive(Publishers.keyboardIsVisible) { isVisible in
            withAnimation {
                keyboardIsPresented = isVisible
            }
        }
    }
}

extension Publishers {
    static var keyboardIsVisible: AnyPublisher<Bool, Never> {
        let willShow = NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)
            .map { _ in true }
        
        let willHide = NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)
            .map { _ in false }
        
        return MergeMany(willShow, willHide)
            .eraseToAnyPublisher()
    }
}

#Preview {
    NavigationView {
        TabBar()
            .environmentObject(TabBarViewModel())
    }
}
