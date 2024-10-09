//
//  HeaderView.swift
//  RumbaV2.0
//
//  Created by Jairo Laurente Celis on 30/09/24.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack {
            Image(systemName: "person")
                .resizable()
                .frame(width: 50,height: 50)
            VStack(alignment: .leading) {
                Text("Nombre person")
                    .font(.custom("Poppins-SemiBold", size: 15))
                Text("Ver perfil")
                    .font(.custom("Poppins-Light", size: 15))
            }
            .padding(.horizontal)
            
            Spacer()
            Image(systemName: "chevron.forward")
                .imageScale(.large)
        }
    }
}

#Preview {
    HeaderView()
}
