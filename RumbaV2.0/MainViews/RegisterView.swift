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
    @State private var confirmPassword = ""
    
    @State private var isLoading = false
    @State private var showAlert = false
    @Environment (\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
                ZStack {
                    Color("negro")
                        .edgesIgnoringSafeArea(.all)
                    
                    ScrollView(showsIndicators: false){
                        VStack{
                            Text("Únete a la Rumba")
                                .font(.custom("Poppins-Bold", size: 30))
                                .foregroundColor(Color("celeste"))
                                .padding(.top)
                            Text("Regístrate")
                                .font(.custom("Poppins-Light", size: 20))
                                .foregroundColor(Color("celeste"))
                            Spacer()
                            VStack{
                                ZStack{
                                    RoundedRectangle(cornerRadius: 40)
                                        .foregroundColor(Color("celeste"))
                                        .frame(width: 335)
                                        .frame(height: 55)
                                        .offset(x: 0, y: 2)
                                    VStack(alignment: .leading){
                                        Text("Nombre")
                                            .font(.custom("Poppins-Light", size: 15))
                                            .foregroundColor(.white)
                                            .padding(.horizontal)
                                    textFieldViews(name: "Nombre", keyName: $name)
                                            .font(.custom("Poppins-Light", size: 15))
                                        .padding(.horizontal)
                                        .offset(y: -15)
                                }
                                   
                                    }
                                ZStack{
                                    RoundedRectangle(cornerRadius: 40)
                                        .foregroundColor(Color("celeste"))
                                        .frame(width: 335)
                                        .frame(height: 55)
                                        .offset(x: 0, y: 2)
                                    
                                    VStack(alignment: .leading){
                                        Text("Apellidos")
                                            .font(.custom("Poppins-Light", size: 15))
                                            .foregroundColor(.white)
                                            .padding(.horizontal)
                                        textFieldViews(name: "Apellidos", keyName: $lastName)
                                            .font(.custom("Poppins-Light", size: 15))
                                            .padding(.horizontal)
                                            .offset(y: -15)
                                    }
                                }
                                
                                ZStack{
                                    RoundedRectangle(cornerRadius: 40)
                                        .foregroundColor(Color("celeste"))
                                        .frame(width: 335)
                                        .frame(height: 55)
                                        .offset(x: 0, y: 2)
                                    
                                    VStack(alignment: .leading){
                                        Text("Celular")
                                            .font(.custom("Poppins-Light", size: 15))
                                            .foregroundColor(.white)
                                            .padding(.horizontal)
                                        textFieldViews(name: "Celular", keyName: $phone)
                                            .font(.custom("Poppins-Light", size: 15))
                                            .keyboardType(.numberPad)
                                            .padding(.horizontal)
                                            .offset(y: -15)
                                    }
                                }
                                ZStack{
                                    RoundedRectangle(cornerRadius: 40)
                                        .foregroundColor(Color("celeste"))
                                        .frame(width: 335)
                                        .frame(height: 55)
                                        .offset(x: 0, y: 2)
                                    
                                    VStack(alignment: .leading){
                                        Text("Correo Electrónico")
                                            .font(.custom("Poppins-Light", size: 15))
                                            .foregroundColor(.white)
                                            .padding(.horizontal)
                                        textFieldViews(name: "Correo", keyName: $email)
                                            .font(.custom("Poppins-Light", size: 16))
                                            .keyboardType(.emailAddress)
                                            .autocapitalization(.none)
                                            .padding(.horizontal)
                                            .offset(y: -15)
                                    }
                                }
                                ZStack{
                                    RoundedRectangle(cornerRadius: 40)
                                        .foregroundColor(Color("celeste"))
                                        .frame(width: 335)
                                        .frame(height: 55)
                                        .offset(x: 0, y: 2)
                                    
                                    VStack(alignment: .leading){
                                        Text("Cree una contaseña")
                                            .font(.custom("Poppins-Light", size: 15))
                                            .foregroundColor(.white)
                                            .padding(.horizontal)
                                        SecureField("Debe tener 8 caracteres", text: $password)
                                            .padding()
                                            .autocapitalization(.none)
                                            .background(Color("humo").opacity(1))
                                            .cornerRadius(40)
                                            .padding(.vertical,15)
                                            .padding(.horizontal)
                                            .offset(y: -15)
                                    }
                                }
                                ZStack{
                                    RoundedRectangle(cornerRadius: 40)
                                        .foregroundColor(Color("celeste"))
                                        .frame(width: 335)
                                        .frame(height: 55)
                                        .offset(x: 0, y: 2)
                                    
                                    VStack(alignment: .leading){
                                        Text("Confirmar contaseña")
                                            .font(.custom("Poppins-Light", size: 15))
                                            .foregroundColor(.white)
                                            .padding(.horizontal)
                                        SecureField("Debe tener 8 caracteres", text: $confirmPassword)
                                            .padding()
                                            .autocapitalization(.none)
                                            .background(Color("humo").opacity(1))
                                            .cornerRadius(40)
                                            .padding(.vertical,15)
                                            .padding(.horizontal)
                                            .offset(y: -15)
                                    }
                                }
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
                                                LinearGradient(colors: [Color("verde"), Color("morado"),Color("celeste")], startPoint: .topLeading, endPoint: .bottomTrailing) : LinearGradient(colors: [Color("gris"), Color("gris"), Color("gris")], startPoint: .leading, endPoint: .trailing)
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
                        .padding(.horizontal)
                    }
                }
                .toolbar{
                    ToolbarItem(placement: .topBarLeading){
                            Button{
                                dismiss()
                            }label: {
                                Image(systemName: "chevron.left")
                                    .foregroundColor(.celeste)
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
            .background(Color("humo"))
            .cornerRadius(40)
            .padding(.vertical,15)
    }
}
#Preview {
    RegisterView()
}
