//
//  LoginView.swift
//  RumbaV2.0
//
//  Created by Jairo Laurente Celis on 3/09/24.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var authViewModel = AuthViewModel()
  
    @ObservedObject var appState: RumbaState
    
    @State private var email = ""
    @State private var password = ""
    
    @State private var showRegister = false
    @State private var isLoading = false
    @State private var showAlert = false
    
    var body: some View {
        
        ZStack {
            Color("negro")
            
            StampShape()
                .fill(
                    LinearGradient(colors: [Color("negro"),Color("celeste"), Color("celeste")], startPoint: .top, endPoint: .bottom)
                )
                .blur(radius: 30)
                .offset(x: 0, y: 450)
               
            
            VStack{
                Image("logo")
                    .resizable()
                    .frame(width: 133,height: 153)
                
                Text("POWER IN A TAP")
                    .font(.system(size: 18).bold())
                    .foregroundColor(.white)
                
                VStack{
                    ZStack {
                        RoundedRectangle(cornerRadius: 40)
                            .foregroundColor(Color("verde"))
                            .frame(width: 328)
                            .frame(height: 58)
                            .offset(x: 5, y: 3)
                        HStack{
                            
                            Image(systemName: "envelope.fill")
                                .padding(.horizontal,5)
                                .foregroundColor(Color("gris").opacity(0.5))
                            
                            TextField("Email", text: $email)
                                
                                .keyboardType(.emailAddress)
                            
                        }
                        .padding()
                        .background(Color("humo"))
                        .cornerRadius(40)
                        .padding(.vertical,15)
                    .padding(.horizontal)
                    }
                    
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 40)
                            .foregroundColor(Color("verde"))
                            .frame(width: 328)
                            .frame(height: 58)
                            .offset(x: 5, y: 3)
                            
                        HStack{
                            Image(systemName: "lock.fill")
                                .padding(.horizontal,5)
                                .foregroundColor(Color("gris").opacity(0.5))
                            
                            SecureField(" Contraseña", text: $password)
                            
                        }
                        .padding()
                        .background(Color("humo").opacity(1))
                        .cornerRadius(40)
                        .padding(.vertical,15)
                    .padding(.horizontal)
                    }
                }
                
                Text("Recordar cuenta")
                    .font(.system(size: 15))
                    .foregroundColor(Color("celeste"))
                    .padding()
                    .padding(.bottom,50)
                
                
                    Button{
                        appState.rumbaState = .principalView
                        /*
                        isLoading = true

                        authViewModel.loginUser(email: email, password: password) { success, error in
                            isLoading = false
                        
                            if success {
                                appState.rumbaState = .principalView
                                print(success)
                            } else {
                                showAlert = true
                            }
                        }
                         */
                    }label: {
                        
                        Text("Iniciar Sesión")
                            .padding()
                            .font(.system(size: 15).bold())
                            .foregroundColor(!email.isEmpty && !password.isEmpty ? Color.white : Color("negro"))
                            .frame(maxWidth: .infinity)
                        
                            .background(
                                !email.isEmpty && !password.isEmpty ?
                                LinearGradient(colors: [Color("verde"),Color("verde"), Color("morado"),Color("morado"),Color("morado"),Color("morado"),Color("celeste"), Color("celeste")], startPoint: .topLeading, endPoint: .bottomTrailing) : LinearGradient(colors: [Color("gris"), Color("gris"), Color("gris")], startPoint: .leading, endPoint: .trailing)
                            )
                            .cornerRadius(40)
                            .padding(.horizontal)
                    }
                    .disabled(email.isEmpty && password.isEmpty)
                
                
                VStack{
                    Text("No tienes una cuenta?")
                        .font(.system(size: 15))
                        .foregroundColor(Color("humo"))
                    Button{
                        showRegister = true
                    }label: {
                        Text("Registrate ahora")
                            .font(.system(size: 13))
                            .foregroundColor(Color("celeste"))
                            .underline()
                    }
                }
                .padding(.top,50)
            }
            .padding()
        }
        .edgesIgnoringSafeArea(.all)
        .fullScreenCover(isPresented: $showRegister, content: {
            RegisterView()
        })
    }
}

#Preview {
    LoginView(appState: .init())
}

