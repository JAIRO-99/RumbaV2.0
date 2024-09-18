//
//  UserView.swift
//  RumbaV2.0
//
//  Created by Jairo Laurente Celis on 3/09/24.
//

import SwiftUI

struct UserView: View {
    var body: some View {
        ZStack {
           Color("negro")
                .edgesIgnoringSafeArea(.all)
            VStack{
                Text("User")
            }
        }
    }
}

#Preview {
    UserView()
}