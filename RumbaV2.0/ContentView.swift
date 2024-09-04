//
//  ContentView.swift
//  RumbaV2.0
//
//  Created by Jairo Laurente Celis on 3/09/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var stateRumba = RumbaState()
    var body: some View {
        Group {
            switch stateRumba.rumbaState {
            case .launchScreen:
                LaunchScreenView()
                    .onAppear{
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3){
                            stateRumba.rumbaState = .authenticationView
                        }
                    }
            case .authenticationView:
                LoginView(appState: stateRumba)
                    .contentShape(Rectangle())
                    .onTapGesture {
                      UIApplication.shared.endEditing()
                    }
            case .principalView:
                TabBarView()
                    .onAppear {
                        UIApplication.shared.endEditing() // Cerrar el teclado al cambiar de vista
                    }
            }
        }
    }
}


// Extensión para cerrar el teclado
extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#Preview {
    ContentView()
}
