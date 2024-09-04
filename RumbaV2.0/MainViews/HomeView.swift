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
                   Color.black // Fondo negro
                   
                   // Huella o sello
            StampShape()
                .fill(Color.white.opacity(0.5)) // Color de la huella con opacidad
                .blur(radius: 30) // Crea el efecto de huella, opcional
                .frame(width: 200, height: 200) // Tamaño de la huella
                .offset(x: 0, y: 0)  // Centra la huella en la pantalla
            }
          .edgesIgnoringSafeArea(.all) // Ignorar los bordes seguros si se desea
      }
}

#Preview {
    HomeView()
}
