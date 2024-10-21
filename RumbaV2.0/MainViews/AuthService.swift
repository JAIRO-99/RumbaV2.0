//
//  AuthService.swift
//  RumbaV2.0
//
//  Created by Jairo Laurente Celis on 3/09/24.
//

import Foundation
import UIKit
//import GoogleSignIn
import Combine

//MANEJO DE ERRORES CON EL REGISTRO
enum UserServiceError: LocalizedError {
    case invalidURL
    case encodingError
    case serverError(String)
    case unknownError(String)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "The URL provided is invalid."
        case .encodingError:
            return "Failed to encode the user data."
        case .serverError(let message):
            return "Server error: \(message)"
        case .unknownError(let message):
            return "Unknown error: \(message)"
        }
    }
}

//MANEJO DE ERRORES CON EL LOGIN
enum LoginServiceError: LocalizedError {
    case invalidURL
    case encodingError
    case serverError(String)
    case unknownError(String)
    case decodingError(String)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "The provided URL is invalid."
        case .encodingError:
            return "Failed to encode the credentials."
        case .serverError(let message):
            return "Server error: \(message)"
        case .unknownError(let message):
            return "Unknown error: \(message)"
        case .decodingError(let message):
            return "Failed to decode response: \(message)"
        }
    }
}

class AuthService {
        // Método para registrar un usuario usando Combine
        func registerUser(user: UserModel) -> AnyPublisher<Bool, Error> {
            guard let url = URL(string: "https://run.mocky.io/v3/42be2a4c-19ca-4ed5-925b-cca4f11cba29") else {
                return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
            }
            
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            do {
                let jsonData = try JSONEncoder().encode(user)
                request.httpBody = jsonData
            } catch {
                return Fail(error: error).eraseToAnyPublisher()
            }
            
            return URLSession.shared.dataTaskPublisher(for: request)
                .tryMap { result in
                    guard let response = result.response as? HTTPURLResponse else {
                        throw URLError(.badServerResponse)
                    }
                    
                    switch response.statusCode {
                    case 200:
                        return true
                    case 400:
                        throw URLError(.networkConnectionLost)
                    case 500:
                        throw URLError(.cannotConnectToHost)
                    default:
                        throw URLError(.unknown)
                    }
                }
                .eraseToAnyPublisher() // Convertimos el Publisher a AnyPublisher
        }
        
        // Método para iniciar sesión usando Combine
        func loginUser(email: String, password: String) -> AnyPublisher<Bool, Error> {
            guard let url = URL(string: "https://c6h117j8-8081.brs.devtunnels.ms/api/thebigfun/v1/auth/login") else {
                return Fail(error: URLError(.badURL)).eraseToAnyPublisher()
            }
            
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            let credentials = ["email": email, "password": password]
            
            do {
                let data = try JSONSerialization.data(withJSONObject: credentials, options: [])
                request.httpBody = data
            } catch {
                return Fail(error: error).eraseToAnyPublisher()
            }
            
            return URLSession.shared.dataTaskPublisher(for: request)
                .tryMap { result in
                    guard let response = result.response as? HTTPURLResponse else {
                        throw URLError(.badServerResponse)
                    }
                    
                    switch response.statusCode {
                    case 200:
                        return true
                    case 401:
                        throw URLError(.userAuthenticationRequired)
                    case 500:
                        throw URLError(.cannotConnectToHost)
                    default:
                        throw URLError(.unknown)
                    }
                }
                .eraseToAnyPublisher()
        }
    
}
    /*
     // Método para login con Google
     func signInWithGoogle(completion: @escaping (Bool, String?) -> Void) {
     guard let presentingViewController = UIApplication.shared.windows.first?.rootViewController else {
     completion(false, "No se encontró una vista válida para Google Sign-In")
     return
     }
     
     GIDSignIn.sharedInstance().signIn(withPresenting: presentingViewController) { signInResult, error in
     if let error = error {
     completion(false, "Error al iniciar sesión con Google: \(error.localizedDescription)")
     return
     }
     
     guard let authentication = signInResult?.user.authentication else {
     completion(false, "No se pudo obtener autenticación de Google")
     return
     }
     
     let idToken = authentication.idToken
     
     // Aquí envías el idToken a tu backend para validarlo y recibir un token de sesión
     UserDefaults.standard.set(idToken, forKey: "userToken")
     completion(true, nil)
     }
     }
     */

