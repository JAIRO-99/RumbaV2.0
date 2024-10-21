/*
import GoogleSignIn
import GoogleSignInSwift
import Foundation
import UIKit

class GoogleSignInService {
    func signInWithGoogle(completion: @escaping (Result<String, Error>) -> Void) {
        let clientID = "TU_CLIENT_ID_GOOGLE"
        _ = GIDConfiguration(clientID: clientID)

        // Obtener el rootViewController correctamente en iOS 15 o posterior
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let rootViewController = windowScene.windows.first?.rootViewController else {
            return
        }

        GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController) { result, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let user = result?.user, let idToken = user.idToken?.tokenString else {
                let authError = NSError(domain: "GoogleSignIn", code: 401, userInfo: [NSLocalizedDescriptionKey: "No se pudo obtener el token de autenticación."])
                completion(.failure(authError))
                return
            }

            // Enviar el ID token al backend
            self.authenticateWithBackend(idToken: idToken) { result in
                switch result {
                case .success(let response):
                    completion(.success(response))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
        }
    }

    private func authenticateWithBackend(idToken: String, completion: @escaping (Result<String, Error>) -> Void) {
        guard let url = URL(string: "https://tu-backend.com/authenticate") else { return }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        let body: [String: Any] = ["idToken": idToken]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                let backendError = NSError(domain: "Backend", code: 500, userInfo: [NSLocalizedDescriptionKey: "No se pudo obtener respuesta del backend."])
                completion(.failure(backendError))
                return
            }

            if let response = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
               let success = response["success"] as? Bool, success {
                completion(.success("Autenticación exitosa"))
            } else {
                let authError = NSError(domain: "Backend", code: 401, userInfo: [NSLocalizedDescriptionKey: "Error de autenticación en el backend."])
                completion(.failure(authError))
            }
        }.resume()
    }
}
*/
