//
//  TabBarView.swift
//  RumbaV2.0
//
//  Created by Jairo Laurente Celis on 3/09/24.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView{
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "hifispeaker")
                }
            
            PurchaseView()
                .tabItem {
                    Label("Gold", systemImage: "bolt")
                }
            
            UserView()
                .tabItem {
                    Label("Perfil", systemImage: "person")
                }
        }
        .accentColor(Color("celeste"))
       
    }
}

#Preview {
    TabBarView()
}
