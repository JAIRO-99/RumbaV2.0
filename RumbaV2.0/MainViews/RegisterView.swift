//
//  RegisterView.swift
//  RumbaV2.0
//
//  Created by Jairo Laurente Celis on 3/09/24.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject private var authViewModel = AuthViewModel()
    @State private var name = ""
    @State private var lastName = ""
    @State private var phone = ""
    @State private var email = ""
    @State private var password = ""
    
    @State private var isLoading = false
    @State private var showAlert = false
    @Environment (\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("negro")
                    .edgesIgnoringSafeArea(.all)
                
                VStack{
                    Text("Crear cuenta")
                        .font(.system(size: 35).bold())
                        .foregroundColor(Color("celeste"))
                        .padding(.top)
                    Spacer()
                    VStack{
                        
                        textFieldViews(name: "Nombre", keyName: $name)
                        
                        textFieldViews(name: "Apellidos", keyName: $lastName)
                        
                        textFieldViews(name: "Celular", keyName: $phone)
                            .keyboardType(.numberPad)
                        
                        textFieldViews(name: "Correo", keyName: $email)
                            .keyboardType(.emailAddress)
                        
                        SecureField("Cotraseña", text: $password)
                            .padding()
                            .background(Color("humo").opacity(0.7))
                            .cornerRadius(10)
                            .padding(.vertical,15)
                    }
                    Spacer()
                    
                    if isLoading {
                        ProgressView()
                            .padding()
                    } else {
                        Button{
                            isLoading = true
                            authViewModel.registerUser(name: name, lastName: lastName, phone: phone, email: email, password: password) { success, error in
                                isLoading = false
                                if success {
                                    dismiss()
                                } else {
                                    showAlert = true
                                }
                            }
                        }label: {
                           
                                Text("Crear cuenta")
                                    .padding()
                                    .font(.system(size: 17).bold())
                                    .foregroundColor(!name.isEmpty && !lastName.isEmpty && !phone.isEmpty && !email.isEmpty && !password.isEmpty ? Color("humo") : Color("humo").opacity(0.5))
                                    .frame(maxWidth: .infinity)
                                    .background(
                                        !name.isEmpty && !lastName.isEmpty && !phone.isEmpty && !email.isEmpty && !password.isEmpty ?
                                        LinearGradient(colors: [Color("verde"), Color("celeste"), Color("morado")], startPoint: .leading, endPoint: .trailing) : LinearGradient(colors: [Color("gris"), Color("gris"), Color("gris")], startPoint: .leading, endPoint: .trailing)
                                    )
                                    .cornerRadius(30)
                                
                                    .padding(.horizontal)
                        }
                        
                        .disabled(name.isEmpty || lastName.isEmpty || phone.isEmpty || email.isEmpty || password.isEmpty)
                        .alert(isPresented: $showAlert) {
                            Alert(title: Text("Error"),message: Text(authViewModel.errorMessage ?? "Error Desconocido"), dismissButton: .default(Text("OK")))
                        }
                    }
                    Spacer()
                }
                .padding()
            }
            .toolbar{
                ToolbarItem {
                    Button{
                        dismiss()
                    }label: {
                        Text("Cerrar")
                            .foregroundColor(Color("celeste"))
                            
                    }
                }
        }
            
        }
        .contentShape(Rectangle())
        .onTapGesture {
            UIApplication.shared.endEditing()
        }
    }
}

struct textFieldViews: View {
    var name: String
    @Binding var keyName: String
    var body: some View {
        TextField(name, text: $keyName)
            .padding()
            .background(Color("humo").opacity(0.7))
            .cornerRadius(10)
            .padding(.vertical,15)
    }
}
#Preview {
    RegisterView()
}
