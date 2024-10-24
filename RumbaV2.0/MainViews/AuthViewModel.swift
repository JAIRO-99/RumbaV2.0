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
    private var cancellables = Set<AnyCancellable>() // Para almacenar los suscriptores
    
    // Método para registrar usuarios usando Combine
    func registerUser(name: String, lastName: String, phone: String, email: String, password: String) {
        let user = UserModel(username: name, password: password, firstname: name, lastname: lastName, email: email)
        
        authService.registerUser(user: user)
            .receive(on: DispatchQueue.main) // Actualizamos en el hilo principal
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                    self?.isAuthenticated = false
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] success in
                self?.isAuthenticated = success
            })
            .store(in: &cancellables) // Almacenamos el suscriptor
    }
    
    // Método para iniciar sesión usando Combine
    func loginUser(email: String, password: String) {
        authService.loginUser(email: email, password: password)
            .receive(on: DispatchQueue.main) // Actualizamos en el hilo principal
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                    self?.isAuthenticated = false
                case .finished:
                    break
                }
            }, receiveValue: { [weak self] success in
                self?.isAuthenticated = success
            })
            .store(in: &cancellables) // Almacenamos el suscriptor
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

