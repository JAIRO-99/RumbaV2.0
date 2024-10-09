//
//  RumbaState.swift
//  RumbaV2.0
//
//  Created by Jairo Laurente Celis on 3/09/24.
//

import Foundation

enum StateRumba {
    case launchScreen
    case welcomeView
    case authenticationView
    case principalView
}

class RumbaState: ObservableObject{
    @Published var rumbaState: StateRumba = .launchScreen
    @Published var isLoggedIn: Bool = false
    /*
    init() {
            // Verificar si hay un token guardado al inicializar
            if UserDefaults.standard.string(forKey: "authToken") != nil {
                self.rumbaState = .principalView
                self.isLoggedIn = true
            } else {
                self.rumbaState = .authenticationView
            }
        }
    */
/*
    func updateState(to newState: StateRumba) {
           DispatchQueue.main.async {
               self.rumbaState = newState
           }
       }
 */
       /*
       func setLoggedIn(_ loggedIn: Bool) {
           DispatchQueue.main.async {
               self.isLoggedIn = loggedIn
           }
       }
        */
}
