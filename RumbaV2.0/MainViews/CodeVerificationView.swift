//
//  CodeVerificationView.swift
//  RumbaV2.0
//
//  Created by Jairo Laurente Celis on 19/09/24.
//

import SwiftUI

struct CodeVerificationView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var inputCode: String = ""
    
    var body: some View {
        NavigationView {
            ZStack (alignment: .bottom){
                Color("negro")
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Text("Número de \nverificación")
                        .font(.custom("Poppins-Bold", size: 35))
                        .foregroundColor(Color("celeste"))
                    
                    Text("Confirme el codigo de su país e \ningrese su número e teléfono")
                        .font(.custom("Poppins-SemiBold", size: 15))
                        .foregroundColor(.white)
                        .padding()
                    VStack{
                       HStack{
                            // El TextField que muestra el valor
                            TextField("0 0 0 0", text: $inputCode)
                                .disabled(true) // Deshabilitar el teclado del sistema
                                .padding()
                                .font(.custom("Poppins-Light", size: 20))
                                .frame(height: 50)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.center)
                                .background(Color("negroClaro"))
                                .cornerRadius(30)
                                .padding(.horizontal,100)
                        }
                        .padding(.horizontal)
                        SeparatorView()
                    }
                    Button{
                        
                    }label: {
                        Text("Continuar")
                            .padding()
                            .font(.custom("Poppins-Bold", size: 20))
                            .foregroundColor(Color.white)
                            .frame(maxWidth: .infinity)
                            .background(
                                LinearGradient(colors: [Color("verde"), Color("morado"),Color("celeste")], startPoint: .topLeading, endPoint: .bottomTrailing)
                            )
                            .cornerRadius(40)
                            .padding(40)
                            .padding(.horizontal,35)
                    }
                    
                    
                    // Teclado numérico personalizado
                    CustomNumberPad(inputText: $inputCode, maxDigits: 4)
                    
                    
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
    }
}
#Preview {
    CodeVerificationView()
}
