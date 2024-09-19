//
//  TabBar.swift
//  RumbaV2.0
//
//  Created by Jairo Laurente Celis on 17/09/24.
//
import SwiftUI

struct TabBar: View {
    
    let tabIcons = ["inicio", "library", "pro"]
    let tabTitles = ["Inicio", "Mi librería", "Pro"]
    @EnvironmentObject var tabBarViewModel: TabBarViewModel
    
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
                HStack{
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
}

#Preview {
    NavigationView{
        TabBar()
            .environmentObject(TabBarViewModel())
    }
}
