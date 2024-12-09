//
//  ContentView.swift
//  RumbaV2.0
//
//  Created by Jairo Laurente Celis on 3/09/24.
//with Google


import SwiftUI

struct ContentView: View {
    @StateObject private var tabBarViewModel = TabBarViewModel()
    @StateObject var stateRumba = RumbaState()
    @StateObject var viewModel = GoogleSignInViewModel()
        
        var body: some View {
            NavigationView {
                switch stateRumba.rumbaState {
                case .launchScreen:
                    LaunchScreenView()
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                if !stateRumba.isLoggedIn {
                                    stateRumba.rumbaState = .welcomeView
                                } else {
                                    stateRumba.rumbaState = .principalView
                                }
                            }
                        }
                    
                case .welcomeView:
                    WelcomeView(appState: stateRumba, googleViewModel: viewModel)
                    
                case .authenticationView:
                    LoginView(googleViewModel: viewModel, appState: stateRumba)
                        
                case .principalView:
                    TabBar(googleViewModel: viewModel)
                        .environmentObject(tabBarViewModel)
                }
            }
            .navigationViewStyle(StackNavigationViewStyle())
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
       // .environmentObject(TabBarViewModel())
}
