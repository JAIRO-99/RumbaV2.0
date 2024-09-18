//
//  CustomerCodeView.swift
//  RumbaV2.0
//
//  Created by Jairo Laurente Celis on 17/09/24.
//

import SwiftUI

struct CustomerCodeView: View {
    @Binding var dismissView: Bool
    @State var customerCode = ""
    var body: some View {
        NavigationView {
            ZStack{
                Color("negro")
                    .edgesIgnoringSafeArea(.all)
                
                VStack{
                    ZStack(){
                        LinearGradient(colors: [Color("verde"), Color("celeste")], startPoint: .bottom, endPoint: .top)
                        Image("cliente")
                            .resizable()
                            .frame(width: 300,height: 280)
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 400)
                    .cornerRadius(30)
                    
                 TextField("Escribe tu código", text: $customerCode)
                        .padding(20)
                        .font(.system(size: 20))
                        .multilineTextAlignment(.center)
                        .keyboardType(.numberPad)
                        .foregroundColor(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke( LinearGradient(colors: [Color("verde"), Color("celeste")], startPoint: .bottom, endPoint: .top), lineWidth: 5)
                        )
                        .background(Color("negro"))
                        .cornerRadius(30)
                        .offset(y: -40)
                        .padding(.horizontal,120)
                        .onChange(of: customerCode, perform: { newValue in
                            if newValue.count > 4 {
                                customerCode = String(newValue.prefix(4))
                            }
                        })
                    
                    VStack(alignment: .center){
                        Text("Inserta tu código Rumbero y disfruta con tus amigos")
                            .foregroundColor(.white)
                            .font(.system(size: 25))
                            .multilineTextAlignment(.center)
                        
                        Spacer()
                        Button{
                            
                        }label:{
                            Text("Que empiece la rumba")
                                .padding(.horizontal,50)
                                .padding()
                                .foregroundColor(.black)
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                            
                        }
                        .background(LinearGradient(colors: [Color("verde"), Color("celeste")], startPoint: .bottom, endPoint: .top))
                        .cornerRadius(30)
                        Spacer()
                    }
                    
                }
                .edgesIgnoringSafeArea(.all)
                
            }
            .toolbar{
                ToolbarItem(placement: .topBarLeading){
                    Button{
                       dismissView = false
                    }label: {
                        Image(systemName: "chevron.left")
                            .padding(10)
                            .background(.white)
                            .clipShape(Circle())
                    }
                }
            }
        }
        .onTapGesture {
            UIApplication.shared.endEditing()
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    CustomerCodeView(dismissView: .constant(false))
}
