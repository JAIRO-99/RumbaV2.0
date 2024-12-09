
import UIKit
import GoogleSignIn

enum LoginError: Error, CustomStringConvertible {
    case signInFailed
    case unknown
    
    var description: String {
        switch self {
        case .signInFailed: return "Sign-in failed. Please try again."
        case .unknown: return "An unknown error occurred."
        }
    }
}

class GoogleSignInService {
    func signIn(completion: @escaping (Result<UserGoogle, Error>) -> Void) {
        if let rootViewController = getRootViewController() {
            GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController) { result, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                guard let result = result else {
                    completion(.failure(LoginError.unknown))
                    return
                }
                let user = UserGoogle(name: result.user.profile?.name ?? "")
                completion(.success(user))
            }
        }
    }
    
    private func getRootViewController() -> UIViewController? {
        guard let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let rootViewController = scene.windows.first?.rootViewController else {
            return nil
        }
        return getVisibleViewController(from: rootViewController)
    }
    
    private func getVisibleViewController(from vc: UIViewController) -> UIViewController {
        if let nav = vc as? UINavigationController {
            return getVisibleViewController(from: nav.visibleViewController!)
        }
        if let tab = vc as? UITabBarController {
            return getVisibleViewController(from: tab.selectedViewController!)
        }
        if let presented = vc.presentedViewController {
            return getVisibleViewController(from: presented)
        }
        return vc
    }
}
