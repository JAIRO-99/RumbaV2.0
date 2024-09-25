//
//  RAnimationView.swift
//  RumbaV2.0
//
//  Created by Jairo Laurente Celis on 20/09/24.
//

import SwiftUI

struct RAnimationView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var isPulsing = false
    @State private var isRotating = false

    var body: some View {
        NavigationView {
            ZStack {
                Color("negro")
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Image("logo")
                        .resizable()
                        .frame(width: 200, height: 200)
                        .scaleEffect(isPulsing ? 1.6 : 1.0) // Efecto de latido
                        .rotation3DEffect(
                            .degrees(isRotating ? 360 : 0), // Rotación en eje Y
                            axis: (x: 0, y: 1, z: 1)
                        )
                    
                        .animation(isRotating ?
                            Animation.linear(duration: 1)
                            .repeatForever(autoreverses: true) :
                                    Animation.easeInOut(duration: 0.6)
                            .repeatForever(autoreverses: true),
                            value: isPulsing
                        )
                }
            }
            .onAppear {
                isPulsing = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    isPulsing = false
                    isRotating = true // Inicia la rotación después de 3 segundos
                }
            }
            .toolbar{
                ToolbarItem(placement: .topBarLeading){
                    Button{
                        dismiss()
                    }label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .padding(.horizontal)
                    }
                }
            }
        }
    }
}

#Preview {
    RAnimationView()
}


