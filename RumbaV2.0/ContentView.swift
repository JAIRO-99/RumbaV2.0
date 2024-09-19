//
//  ContentView.swift
//  RumbaV2.0
//
//  Created by Jairo Laurente Celis on 3/09/24.
//


import SwiftUI

struct ContentView: View {
    @StateObject var stateRumba = RumbaState()
    @StateObject private var tabBarViewModel = TabBarViewModel()
   
    var body: some View {
        
        Group {
            switch stateRumba.rumbaState {
            case .launchScreen:
                LaunchScreenView()
                    .onAppear{
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3){
                            stateRumba.rumbaState = .welcomeView
                        }
                    }
            case .welcomeView:
                WelcomeView(appState: stateRumba)
                    
            case .authenticationView:
                LoginView(appState: stateRumba)
                    
                    .onTapGesture {
                      UIApplication.shared.endEditing()
                    }
            case .principalView:
                TabBar()
                    .environmentObject(tabBarViewModel)
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
        .environmentObject(TabBarViewModel())
}
