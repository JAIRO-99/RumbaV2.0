//
//  AuthViewModel.swift
//  RumbaV2.0
//
//  Created by Jairo Laurente Celis on 3/09/24.
//

import Foundation
import Combine


class AuthViewModel: ObservableObject {
  
    @Published var isAuthenticated = false
    @Published var errorMessage: String?
    
    private let authService = AuthService()
    
    func registerUser(name: String, lastName: String, phone: String, email: String, password: String, completion: @escaping (Bool, String?) -> Void){
        let user = UserModel(name: name, lastName: lastName, phone: phone, email: email, password: password)
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
    
    func loginUser(email: String, password: String, completion: @escaping (Bool, String?) -> Void){
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
}
