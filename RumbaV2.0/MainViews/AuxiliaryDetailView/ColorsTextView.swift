//
//  ColorsTextView.swift
//  RumbaV2.0
//
//  Created by Jairo Laurente Celis on 18/09/24.
//

import SwiftUI

struct ColorsTextView: View {
    var text: String
    var body: some View {
        Text(text)
            .padding()
            .padding(.horizontal,70)
            .foregroundColor(.white)
            .fontWeight(.bold)
            .overlay(
            RoundedRectangle(cornerRadius: 30)
                .stroke(LinearGradient(colors: [Color("verde"),Color("morado"), Color("celeste")], startPoint: .top, endPoint: .bottom), lineWidth: 4)
            )
            .background(Color("negro"))
            .cornerRadius(30)
    }
}

#Preview {
    ColorsTextView(text: "hello")
}
