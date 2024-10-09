//
//  SideMenuView.swift
//  RumbaV2.0
//
//  Created by Jairo Laurente Celis on 27/09/24.
//

import SwiftUI

struct SideMenuView: View {
    @State private var showMenu = false
    @State private var selectTab = 0
    var body: some View {
        NavigationView{
            ZStack{
                TabView(selection: $selectTab){
                 UserView()
                        .tag(0)
                    
                 PurchaseView()
                        .tag(1)
                    
                    Text("Cerrar sesión")
                        .tag(2)
                    
                }
                ContentSideMenuView(isShowing: $showMenu, selectedTab: $selectTab, darkMode: false, image: "")
            }
            .toolbar{
                ToolbarItem (placement: .topBarLeading){
                    Button{
                        showMenu.toggle()
                    }label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundColor(.blue)
                    }
                }
            }
        }
    }
}

#Preview {
    SideMenuView()
}
