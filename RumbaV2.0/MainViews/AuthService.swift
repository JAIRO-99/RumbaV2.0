//
//  AuthService.swift
//  RumbaV2.0
//
//  Created by Jairo Laurente Celis on 3/09/24.
//

import Foundation

class AuthService {
    
    func registerUser(user: UserModel, completion: @escaping (Bool, String?) -> Void) {
        guard let url = URL(string: "https://run.mocky.io/v3/42be2a4c-19ca-4ed5-925b-cca4f11cba29") else {
            completion(false, "URL inválida")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let jsonData = try JSONEncoder().encode(user)
            request.httpBody = jsonData
        } catch {
            completion(false, "Error al codificar el usuario")
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(false, "Error: \(error.localizedDescription)")
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                completion(false, "Respuesta inválida del servidor")
                return
            }
            
            guard let data = data, !data.isEmpty else {
                completion(false, "No se recibió respuesta del servidor")
                return
            }
            
            switch response.statusCode {
            case 200:
                // Aquí podrías decodificar los datos si fuera necesario
                completion(true, nil)
            case 400:
                completion(false, "Solicitud incorrecta, revisa los datos ingresados")
            case 500:
                completion(false, "Error del servidor, intenta nuevamente más tarde")
            default:
                completion(false, "Error desconocido con código: \(response.statusCode)")
            }
        }
        .resume()
    }
    
    func loginUser(email: String, password: String, completion: @escaping (Bool, String?) -> Void) {
        
        guard let url = URL(string: "https://messonstats.com:8443/login") else {
            completion(false, "URL inválida")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let credentials = ["email": email, "password": password]
        
        do {
            let data = try JSONSerialization.data(withJSONObject: credentials, options: [])
            request.httpBody = data
        } catch {
            completion(false, "Error al codificar las credenciales")
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(false, "Error: \(error.localizedDescription)")
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                completion(false, "Respuesta inválida del servidor")
                return
            }
            
            guard let data = data, !data.isEmpty else {
                completion(false, "No se recibió respuesta del servidor")
                return
            }
            
            switch response.statusCode {
            case 200:
                // Aquí podrías decodificar los datos si fuera necesario
                completion(true, nil)
            case 401:
                completion(false, "Email o contraseña incorrectos")
            case 500:
                completion(false, "Error del servidor, intenta nuevamente más tarde")
            default:
                completion(false, "Error desconocido con código: \(response.statusCode)")
            }
        }
        .resume()
    }
}
