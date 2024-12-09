//
//  RumbaState.swift
//  RumbaV2.0
//
//  Created by Jairo Laurente Celis on 3/09/24.
//

import SwiftUI
import GoogleSignIn

enum StateRumba {
    case launchScreen
    case welcomeView
    case authenticationView
    case principalView
}

class RumbaState: ObservableObject {
    @Published var rumbaState: StateRumba = .launchScreen
    @Published var isLoggedIn: Bool = false

    init() {
        checkLoginStatus()
    }
    
    func checkLoginStatus() {
        // Restaurar sesión de Google si existe una activa
        GIDSignIn.sharedInstance.restorePreviousSignIn { [weak self] user, error in
            DispatchQueue.main.async {
                if user != nil {
                    self?.isLoggedIn = true
                    self?.rumbaState = .principalView // Ir directamente a la vista principal
                } else {
                    self?.isLoggedIn = false
                    self?.rumbaState = .launchScreen // Mantener el flujo original
                }
            }
        }
    }
    
    func logIn() {
        isLoggedIn = true
        rumbaState = .principalView
    }
    
    func logOut() {
        GIDSignIn.sharedInstance.signOut()
        isLoggedIn = false
        rumbaState = .authenticationView // Redirigir a la vista de autenticación tras el cierre de sesión
    }
}
