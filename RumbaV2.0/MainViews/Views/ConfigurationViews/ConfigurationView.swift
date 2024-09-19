//
//  ConfigurationView.swift
//  RumbaV2.0
//
//  Created by Jairo Laurente Celis on 18/09/24.
//

import SwiftUI

struct ConfigurationView: View {
    @Environment(\.dismiss) var dismiss
    @State private var showPerfil = false
    var body: some View {
        ZStack {
            Color("negro")
                .edgesIgnoringSafeArea(.all)
            VStack{
                Text("Configuración")
                    .font(.system(size: 25))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    
                Button{
                    
                }label: {
                    HStack{
                        Image(systemName: "person")
                            .resizable()
                            .padding()
                            .frame(width: 70,height: 70)
                            .foregroundColor(.white)
                            .background(Color.accentColor)
                            .cornerRadius(50)
                        
                        VStack(alignment: .leading){
                            Text("Panchito 123")
                                .font(.system(size: 20))
                                .foregroundColor(.white)
                            Text("Ver perfil")
                                .font(.system(size: 15))
                                .foregroundColor(.white).opacity(0.6)
                        }
                        .padding()
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .resizable()
                            .frame(width: 10,height: 20)
                            .foregroundColor(.white).opacity(0.5)
                    }
                    .padding()
                    .padding(.horizontal,20)
                }
                
                Button{
                    
                }label: {
                    Text("HAZTE PRO")
                        .font(.system(size: 20))
                        .padding(10)
                        .padding(.horizontal,50)
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .background(LinearGradient(colors: [Color("verde"), Color("morado"), Color("celeste")], startPoint: .topLeading, endPoint: .bottomTrailing))
                        .cornerRadius(30)
                }
                
                Button{
                    
                }label: {
                    HStack{
                        Image("pro")
                            .resizable()
                            .frame(width: 25,height: 25)
                        
                            Text("Pro")
                                .font(.system(size: 20))
                                .foregroundColor(.white)
                                .padding(.horizontal)
                        Spacer()
                        
                        Image(systemName: "chevron.right")
                            .resizable()
                            .frame(width: 10,height: 20)
                            .foregroundColor(.white).opacity(0.5)
                    }
                    .padding()
                    .padding(.horizontal,20)
                }
                Button{
                    
                }label: {
                    CardConfiguration(image: "person.2.fill", description: "Encuentranos")
                }
                Button{
                    
                }label: {
                    CardConfiguration(image: "person.3.fill", description: "Encuentranos")
                }
                Spacer()
                Button{
                    
                }label: {
                    ColorsTextView(text: "Cerrar sesión")
                }
                Spacer()
            }
        }
        .fullScreenCover(isPresented: $showPerfil, content: {
            EmptyView()
        })
        .toolbar{
            ToolbarItem(placement: .topBarLeading){
                Button{
                   dismiss()
                }label: {
                    Image(systemName: "chevron.left")
                        .padding(10)
                        .foregroundColor(.white)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    ConfigurationView()
}

struct CardConfiguration: View {
    var image: String
    var description: String
    var body: some View {
        HStack{
            Image(systemName: image)
                .resizable()
                .frame(width: 30,height: 20)
                .foregroundColor(.white)

            Text("\(description)")
                .font(.system(size: 20))
                .foregroundColor(.white)
                .padding(.horizontal)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .resizable()
                .frame(width: 10,height: 20)
                .foregroundColor(.white).opacity(0.5)
        }
        .padding()
        .padding(.horizontal,20)
    }
}
