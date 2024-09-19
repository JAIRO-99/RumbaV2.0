//
//  RecuperationForNumberView.swift
//  RumbaV2.0
//
//  Created by Jairo Laurente Celis on 19/09/24.
//

import SwiftUI

struct RecuperationForNumberView: View {
    @Environment(\.dismiss) var dismiss
    @State private var inputText: String = ""
    
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
                        SeparatorView()
                        HStack{
                            Image("peru")
                                .resizable()
                                .frame(width: 20,height: 20)
                            Text("Perú")
                                .font(.custom("Poppins-Light", size: 20))
                                .foregroundColor(.white)
                            Spacer()
                        }
                        .padding(.horizontal)
                        SeparatorView()
                        
                        HStack{
                            Text("+51")
                                .font(.custom("Poppins-Light", size: 20))
                                .foregroundColor(.white)
                            
                            // El TextField que muestra el valor
                            TextField("000 000 000", text: $inputText)
                                .disabled(true) // Deshabilitar el teclado del sistema
                                .padding()
                                .font(.custom("Poppins-Light", size: 20))
                                .frame(height: 50)
                                .foregroundColor(.white)
                                .background(Color("negroClaro"))
                                .cornerRadius(30)
                                .padding(.trailing,50)
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
                            .padding()
                            .padding(.horizontal,40)
                    }
                    // Teclado numérico personalizado
                    CustomNumberPad(inputText: $inputText, maxDigits: 9)
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

struct CustomNumberPad: View {
    @Binding var inputText: String
    var maxDigits: Int
    let numbers = [
        ["1", "2", "3"],
        ["4", "5", "6"],
        ["7", "8", "9"],
        ["", "0", "⌫"] // Botón de borrar
    ]
    
    var body: some View {
        VStack {
            ForEach(numbers, id: \.self) { row in
                HStack (spacing: 20) {
                    ForEach(row, id: \.self) { number in
                        Button(action: {
                            buttonPressed(number)
                        }) {
                            Text(number)
                                .font(.custom("Poppins-SemiBold", size: 30))
                                .frame(width: 100, height: 60)
                                .foregroundColor(.white)
                                .background(Color.negroClaro)
                                .cornerRadius(10)
                        }
                        .disabled(number.isEmpty) // Deshabilitar botones vacíos
                    }
                }
            }
        }
        .frame(maxWidth: .infinity)
        .frame(maxHeight: .infinity)
        .background(Color("gris"))
        .cornerRadius(20)
        .edgesIgnoringSafeArea(.all)
        
    }
    
    // Función que maneja la entrada del teclado personalizado
    func buttonPressed(_ number: String) {
        if number == "⌫" {
            if !inputText.isEmpty {
                inputText.removeLast()
            }
        } else if inputText.count < maxDigits { // Limitar la entrada de dígitos
            inputText += number
        }
    }
}

#Preview {
    RecuperationForNumberView()
}




struct SeparatorView: View {
    var body: some View {
        Rectangle()
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .frame(height: 1)
            .padding(.horizontal)
    }
}
