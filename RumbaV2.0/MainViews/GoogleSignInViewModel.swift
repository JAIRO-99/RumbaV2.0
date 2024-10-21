//
//  GoogleSignInViewModel.swift
//  RumbaV2.0
//
//  Created by Jairo Laurente Celis on 23/09/24.
//
import Foundation
import Combine

class GoogleSignInViewModel: ObservableObject {
    @Published var signInStatus: String = ""
    @Published var isAuthenticated = false
    @Published var isLoading = false

    private var cancellables = Set<AnyCancellable>()
   // private let googleSignInService = GoogleSignInService()

    /*func signInWithGoogle() {
        isLoading = true
        googleSignInService.signInWithGoogle { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let message):
                    self?.signInStatus = message
                    self?.isAuthenticated = true
                case .failure(let error):
                    self?.signInStatus = error.localizedDescription
                    self?.isAuthenticated = false
                }
            }
        }
    }
    */
}
