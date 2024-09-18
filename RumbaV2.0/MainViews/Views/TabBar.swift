//
//  TabBar.swift
//  RumbaV2.0
//
//  Created by Jairo Laurente Celis on 17/09/24.
//
import SwiftUI

struct TabBar: View {
    
    let tabIcons = ["inicio", "library", "pro"]
    let tabTitles = ["Inicio", "Mi librería", "Pro"] // Títulos que cambian con cada icono
    @State var indexSelectedIcons = 0
    
    
    var body: some View {
        
        
        ZStack {
            Color("negro")
                .edgesIgnoringSafeArea(.all)
            VStack {
                ZStack{
                    
                    switch indexSelectedIcons {
                    case 0:
                            HomeView()
                    case 1:
                        NavigationView{
                            PurchaseView()
                        }
                        .navigationTitle("Mi librería")
                    default:
                        NavigationView{
                            UserView()
                        }
                        .navigationTitle("Pro")
                    }
                }
              //  Spacer()
                HStack{
                    ForEach(0..<3) { icon in
                        Spacer()
                        Button {
                            self.indexSelectedIcons = icon
                        } label: {
                            if indexSelectedIcons == icon {
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
                //.offset(y: 30)
            }
            
        }
        
        
    }
}

#Preview {
    NavigationView{
        TabBar()
    }
}
