//
//  RumbaV2_0App.swift
//  RumbaV2.0
//
//  Created by Jairo Laurente Celis on 3/09/24.
//

import SwiftUI
import GoogleSignIn
import GoogleSignInSwift

@main
struct RumbaV2_0App: App {
    @StateObject private var viewModel = GoogleSignInViewModel()
    var body: some Scene {
           WindowGroup {
               ContentView()
                   .environmentObject(viewModel)
                   .onOpenURL { url in
                       GIDSignIn.sharedInstance.handle(url)
                   }
                   .onAppear {
                       GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
                           if let user {
                               viewModel.authState = .loggedIn(UserGoogle(name: user.profile?.name ?? ""))
                           }
                       }
                   }
           }
       }
}
