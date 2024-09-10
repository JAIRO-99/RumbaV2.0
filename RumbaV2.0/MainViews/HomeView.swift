//
//  HomeView.swift
//  RumbaV2.0
//
//  Created by Jairo Laurente Celis on 3/09/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Color("negro")
                .edgesIgnoringSafeArea(.all)
            VStack{
                Text("hello")
                    .foregroundColor(.white)
            }
        }
      }
}

#Preview {
    HomeView()
}
