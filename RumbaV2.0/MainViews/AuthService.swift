//
//  AuthService.swift
//  RumbaV2.0
//
//  Created by Jairo Laurente Celis on 3/09/24.
//

import Foundation
import UIKit
import GoogleSignIn

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
              //decodificar los datos si fuera necesario
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
           
           guard let url = URL(string: "https://c6h117j8-8081.brs.devtunnels.ms/api/thebigfun/v1/auth/login") else {
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
               
               guard let response = response as? HTTPURLResponse, let data = data else {
                   completion(false, "Respuesta inválida del servidor")
                   return
               }
               
               switch response.statusCode {
               case 200:
                   do {
                       // Intentamos decodificar la respuesta y guardar el token
                       if let jsonResponse = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                          let token = jsonResponse["token"] as? String {
                           
                           // Guardamos el token en UserDefaults
                           UserDefaults.standard.set(token, forKey: "authToken")
                           
                           completion(true, nil)
                       } else {
                           completion(false, "Formato de respuesta inesperado")
                       }
                   } catch {
                       completion(false, "Error al procesar los datos")
                   }
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
}
