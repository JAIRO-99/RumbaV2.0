//
//  RumbaState.swift
//  RumbaV2.0
//
//  Created by Jairo Laurente Celis on 3/09/24.
//

import Foundation

enum StateRumba {
    case launchScreen
    case authenticationView
    case principalView
}

class RumbaState: ObservableObject{
    @Published var rumbaState: StateRumba = .launchScreen
    @Published var isLoggedIn: Bool = false

    func updateState(to newState: StateRumba) {
           DispatchQueue.main.async {
               self.rumbaState = newState
           }
       }
       /*
       func setLoggedIn(_ loggedIn: Bool) {
           DispatchQueue.main.async {
               self.isLoggedIn = loggedIn
           }
       }
        */
}
