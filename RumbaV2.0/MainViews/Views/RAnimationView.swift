//
//  RAnimationView.swift
//  RumbaV2.0
//
//  Created by Jairo Laurente Celis on 20/09/24.
//

import SwiftUI

struct RAnimationView: View {
    var body: some View {
        NavigationView{
            ZStack{
                Color("negro")
                    .edgesIgnoringSafeArea(.all)
                
                VStack{
                    Image("logo")
                }
            }
        }
    }
}

#Preview {
    RAnimationView()
}
