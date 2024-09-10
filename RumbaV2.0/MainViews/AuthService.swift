import Foundation


enum NetworkError: Error {
    case noData
    case invalidResponse
    case serverError(statusCode: Int)
    case decodingError
    case unknown
    
    var localizedDescription: String {
        switch self {
        case .noData: return "No data received"
        case .invalidResponse: return "Invalid response from server"
        case .serverError(let statusCode): return "Server error with status code \(statusCode)"
        case .decodingError: return "Failed to decode response"
        case .unknown: return "An unknown error occurred"
        }
    }
}

class AuthService {
    func registerUser(user: UserModel, completion: @escaping (Bool,String?) -> Void) {
        guard let url = URL(string: "https://messonstats.com:8443/register") else {
            completion(false,"URL Inválida")
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do{
            let jsonData = try JSONEncoder().encode(user)
            request.httpBody = jsonData
        } catch {
            completion(false,"Error al codificar el usuario")
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(false,"Error: \(error.localizedDescription)")
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                completion(false,"Respuesta inválidad del servidor")
                return
            }
            
            switch response.statusCode{
            case 200:
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
        
        let credentials = ["username": email, "password": password]
        
        do {
            let data = try JSONSerialization.data(withJSONObject: credentials, options: [])
            print(data)
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
            
            switch response.statusCode {
            case 200:
                completion(true, nil)
            case 401:
                completion(false, "Email o contraseña incorrectos 111")
            case 500:
                completion(false, "Error del servidor, intenta nuevamente más tarde")
            default:
                completion(false, "Error desconocido con código: \(response.statusCode)")
            }
        }
        .resume()
    }
    
    // crear un folder LocalStorage nombre
}

