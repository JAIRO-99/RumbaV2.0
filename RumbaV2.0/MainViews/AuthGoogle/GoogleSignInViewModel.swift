//
//  GoogleSignInViewModel.swift
//  RumbaV2.0
//
//  Created by Jairo Laurente Celis on 23/09/24.
//
import Foundation
import GoogleSignIn
import GoogleSignInSwift
import SwiftUI

enum AuthState {
    case loggedOut
    case loggedIn(UserGoogle)
    case loading
}

class GoogleSignInViewModel: ObservableObject {
    @Published var authState: AuthState = .loggedOut
    @Published var errorMessage: ErrorMessage?

    
    private let googleSignInService = GoogleSignInService()
    
    func signIn() {
        authState = .loading
        googleSignInService.signIn { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let user):
                    self?.authState = .loggedIn(user)
                case .failure(let error):
                    self?.authState = .loggedOut
                    self?.errorMessage = ErrorMessage(message: error.localizedDescription)
                    
                }
            }
        }
    }
    
    func signOut() {
        GIDSignIn.sharedInstance.signOut()
        authState = .loggedOut
    }
}

