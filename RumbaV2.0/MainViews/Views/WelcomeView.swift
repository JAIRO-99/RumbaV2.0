//
//  WelcomeView.swift
//  RumbaV2.0
//
//  Created by Jairo Laurente Celis on 17/09/24.
//

import SwiftUI

struct WelcomeView: View {
    @ObservedObject var appState: RumbaState
    @State private var showRegisterView = false
    var body: some View {
        ZStack{
            Color("negro")
                .edgesIgnoringSafeArea(.all)
            VStack{
                Spacer()
                Image("rumba")
                    .resizable()
                    .frame(width: 280,height: 100)
           
                Text("Bienvenido!")
                    .font(.system(size: 25))
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.top,100)
                
                VStack(alignment: .center){
                    Button{
                        appState.rumbaState = .authenticationView
                    }label: {
                        Text("Iniciar sesión")
                            .padding()
                            .padding(.horizontal,70)
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .background(LinearGradient(colors: [Color("verde"),Color("morado"), Color("celeste")], startPoint: .topLeading, endPoint: .bottomTrailing))
                            .cornerRadius(30)
                    }
                    
                    Button{
                        showRegisterView = true
                    }label: {
                        Text("Crear cuenta")
                            .padding()
                            .padding(.horizontal,70)
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(LinearGradient(colors: [Color("verde"),Color("morado"), Color("celeste")], startPoint: .top, endPoint: .bottom), lineWidth: 4)
                            )
                            .background(Color("negro"))
                            .cornerRadius(30)
                    }
                    .padding()
                }
              Spacer()
                VStack{
                    HStack{
                        Button{
                            
                        }label: {
                            Image("google")
                                .resizable()
                                .frame(width: 20,height: 20)
                                .padding(8)
                                .background(Color("gris"))
                                .cornerRadius(10)
                        }
                        Button{
                            
                        }label: {
                            Image("apple")
                                .resizable()
                                .frame(width: 20,height: 20)
                                .padding(8)
                                .background(Color("gris"))
                                .cornerRadius(10)
                        }
                        Button{
                            
                        }label: {
                            Image("facebook")
                                .resizable()
                                .frame(width: 18,height: 20)
                                .padding(8)
                                .background(Color("gris"))
                                .cornerRadius(10)
                        }
                    }
                    Text("Iniciar sesión con otra cuenta")
                        .foregroundColor(.white)
                        .padding()
                }
            }
        }
        .fullScreenCover(isPresented: $showRegisterView, content: {
            RegisterView()
        })
    }
}

#Preview {
    WelcomeView(appState: .init())
}

