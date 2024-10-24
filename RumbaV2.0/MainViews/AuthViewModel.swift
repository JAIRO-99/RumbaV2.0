//
//  AuthViewModel.swift
//  RumbaV2.0
//
//  Created by Jairo Laurente Celis on 3/09/24.
//

import Foundation
import Combine
import GoogleSignInSwift


class AuthViewModel: ObservableObject {
  
    @Published var isAuthenticated = false
    @Published var errorMessage: String?
    
    private let authService = AuthService()
    
    func registerUser(name: String, lastName: String, phone: String, email: String, password: String, completion: @escaping (Bool, String?) -> Void){
        let user = UserModel(username: name, password: password, firstname: name, lastname: lastName, email: email)
        authService.registerUser(user: user) { [weak self] success, error in
            DispatchQueue.main.async {
                if success {
                    self?.isAuthenticated = true
                    completion(true, nil)
                } else {
                    self?.errorMessage = error
                    completion(false, error)
                }
            }
        }
    }
    
    func loginUser(email: String, password: String, completion: @escaping (Bool, String?) -> Void) {
            authService.loginUser(email: email, password: password) { [weak self] success, error in
                DispatchQueue.main.async {
                    if success {
                        self?.isAuthenticated = true
                        completion(true, nil)
                    } else {
                        self?.errorMessage = error
                        completion(false, error)
                    }
                }
            }
        }
    /*
    // Método para login con Google
       func loginWithGoogle(completion: @escaping (Bool, String?) -> Void) {
           authService.signInWithGoogle { [weak self] success, error in
               DispatchQueue.main.async {
                   if success {
                       self?.isAuthenticated = true
                       completion(true, nil)
                   } else {
                       self?.errorMessage = error
                       completion(false, error)
                   }
               }
           }
       }
     */
}
