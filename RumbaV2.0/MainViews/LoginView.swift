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
    @State private var showVericationView = false
    
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
                
                Text("Hola, bienvenido de nuevo!")
                
                    .font(.custom("Poppins-Bold",size: 18))
                    .foregroundColor(.humo)
                
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
                                .autocapitalization(.none)
                                .autocorrectionDisabled()
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
                                .autocapitalization(.none)
                                .autocorrectionDisabled()
                            
                        }
                        .padding()
                        .background(Color("humo").opacity(1))
                        .cornerRadius(40)
                        .padding(.vertical,15)
                    .padding(.horizontal)
                    }
                }
                HStack{
                 Spacer()
                    Button{
                        showVericationView = true
                    }label: {
                        Text("Olvidaste la contraseña?")
                            .font(.custom("Poppins-Light", size: 12))
                            .foregroundColor(Color("celeste"))
                            .padding()
                            .padding(.bottom,50)
                            .offset(y: -20)
                    }
                   
                    
                }
                
                    Button{
                       appState.rumbaState = .principalView
                        /*
                        isLoading = true
                        authViewModel.loginUser(email: email, password: password) { success, error in
                            isLoading = false
                            if success {
                                appState.rumbaState = .principalView
                            } else {
                                showAlert = true
                            }
                        }
                        */
                    }label: {
                        Text("Iniciar Sesión")
                            .padding()
                            .font(.custom("Poppins-Bold", size: 20))
                            .foregroundColor(!email.isEmpty && !password.isEmpty ? Color.white : Color.white)
                            .frame(maxWidth: .infinity)
                            .background(
                            RoundedRectangle(cornerRadius: 40)
                                .stroke(!email.isEmpty && !password.isEmpty ?
                                        LinearGradient(colors: [Color("verde"), Color("morado"),Color("celeste")], startPoint: .topLeading, endPoint: .bottomTrailing) : LinearGradient(colors: [Color("verde"), Color("morado"),Color("celeste")], startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: !email.isEmpty && !password.isEmpty ? 60 : 4)
                            )
                            .cornerRadius(40)
                            .padding(.horizontal)
                           
                    }
                    .disabled(email.isEmpty || password.isEmpty)
                
                
                HStack{
                    Text("Nuevo usuario?")
                        .font(.system(size: 15))
                        .foregroundColor(Color("humo"))
                    Button{
                        showRegister = true
                    }label: {
                        Text("Registrate")
                            .font(.custom("Poppins-SemiBold", size: 12))
                                   .overlay(
                                       LinearGradient(
                                           gradient: Gradient(colors: [.morado, .celeste]),
                                           startPoint: .leading,
                                           endPoint: .trailing
                                       )
                                       .mask(
                                           Text("Registrate")
                                            .font(.custom("Poppins-SemiBold", size: 12))
                                               
                                       )
                                   )
                         
                    }
                }
                .padding(.top,50)
                HStack{
                    ButtonAuthentication(action: {
                        
                    }, image: "google")
                    
                    ButtonAuthentication(action: {
                        
                    }, image: "apple")
                    ButtonAuthentication(action: {
                        
                    }, image: "facebook")
                }
                .padding()
                Text("Iniciar sesión con otra cuenta")
                    .font(.custom("Poppins-Light", size: 13))
                    .foregroundColor(.white)
            }
            .padding()
        }
        .edgesIgnoringSafeArea(.all)
        .fullScreenCover(isPresented: $showRegister, content: {
            RegisterView()
        })
        .fullScreenCover(isPresented: $showVericationView, content: {
            RecuperationForNumberView()
        })
    }
}

#Preview {
    LoginView(appState: .init())
}

struct CustomTextField: View {
    let icon: String
    let placeholder: String
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.gray)
            TextField(placeholder, text: $text)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .padding()
                .background(Color("humo"))
                .cornerRadius(10)
        }
        .padding(.horizontal)
    }
}
