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
                        ColorsTextView(text: "Crear cuenta")
                    }
                    .padding()
                }
              Spacer()
                VStack{
                    HStack{
                        ButtonAuthentication(action: {
                            print("auntenticate con google")
                        }, image: "google")
                        ButtonAuthentication(action: {
                            
                        }, image: "apple")
                        ButtonAuthentication(action: {
                            
                        }, image: "facebook")
                        
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


// BOTÓN DE AUTENTICACION
struct ButtonAuthentication: View {
    var action: (() -> ())
    var image: String
    var body: some View {
        Button{
            action()
        }label: {
            if image == "facebook"{
                Image(image)
                    .resizable()
                    .frame(width: 15, height: 20)
            }else{
                Image(image)
                    .resizable()
                    .frame(width: 20, height: 20)
            }
                
        }
        .padding(8)
        .frame(width: 40,height: 35)
        .background(LinearGradient(colors: [Color("negroClaro"),Color("negroClaro"), Color("humo")], startPoint: .bottom, endPoint: .top))
        .cornerRadius(10)
    }
}
