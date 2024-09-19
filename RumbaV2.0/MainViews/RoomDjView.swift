//
//  RoomDjView.swift
//  RumbaV2.0
//
//  Created by Jairo Laurente Celis on 18/09/24.
//

import SwiftUI

struct RoomDjView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var showListMusic = false
    @State private var showListGuests = false
    var body: some View {
       
        NavigationView {
            ZStack{
                    Color("negro")
                        .edgesIgnoringSafeArea(.all)
                    VStack{
                        VStack(alignment: .leading){
                            HStack{
                                Text("Organizado por ti")
                                    .font(.custom("Poppins-Light",size: 15))
                                    .foregroundColor(Color("celeste"))
                                Spacer()
                            }
                            .padding()
                            Button{
                                
                            }label: {
                                Text("Invitar")
                                    .padding(8)
                                    .padding(.horizontal,30)
                                    .font(.custom("Poppins-Bold", size: 18))
                                    .foregroundColor(Color.black)
                                    .background(Color("celeste"))
                                    .cornerRadius(30)
                            }
                            .padding(.horizontal)
                        }
                        Spacer()
                        //DEBO AGREGAR UN LÓGICA CON EL ENDPOINT DEL ARRAY DE MÚSICAS SUBIDAS, MÁS NO CON EL BOTON DE "+"
                        if !showListMusic {
                            VStack{
                                Image(systemName: "play.fill")
                                    .resizable()
                                    .foregroundColor(.blue)
                                    .frame(width: 100,height: 100)
                                
                                    Text("Preparado para la Rumba?")
                                    .font(.custom("Poppins-Light", size: 13))
                                    .foregroundColor(.white).opacity(0.6)
                                    .padding(.top)
                                
                                Text("Pon algo de música de tu biblioteca, luego presiona el boton de reproducción")
                                    .font(.custom("Poppins-Light", size: 18))
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.center)
                            }
                            .padding()
                        } else {
                            
                        }
                        Spacer()
                        VStack(alignment: .leading){
                            Text("Lista de reproducción")
                                .font(.custom("Poppins-SemiBold", size: 18))
                                .foregroundColor(.white)
                            
                            HStack{
                                HStack{
                             Image(systemName: "shuffle")
                                        .foregroundColor(Color("morado"))
                                    Text("Aleatorio")
                                        .font(.custom("Poppins-Light", size: 15))
                                        .foregroundColor(.white)
                                }
                                .padding(10)
                                .overlay(
                                RoundedRectangle(cornerRadius: 30)
                                    .stroke(Color("morado"), lineWidth: 2)
                                )
                               
                                Button{
                                    
                                }label: {
                                    Text("Vista del reproductor")
                                        .font(.custom("Poppins-SemiBold", size: 15))
                                        .padding(10)
                                        .foregroundColor(.black)
                                        .background(Color("verde"))
                                        .cornerRadius(20)
                                }
                            }
                        }
                        Spacer()
                    }
                }
                .toolbar{
                    ToolbarItem{
                        Button{
                            showListGuests = true
                        }label: {
                            HStack{
                                Image(systemName: "person.2.fill")
                                    .foregroundColor(.white)
                                Text("6/10")
                                    .font(.custom("Poppins-SemiBold", size: 18))
                                    .foregroundColor(.white)
                            }
                        }
                    }
                    ToolbarItem(placement: .topBarLeading){
                            Button{
                                dismiss()
                            }label: {
                                Image(systemName: "chevron.left")
                                    .foregroundColor(.white)
                            }
                        }
            }
                .fullScreenCover(isPresented: $showListGuests, content: {
                    ListGuestsView()
                })
            .navigationBarBackButtonHidden(true)
        }
        
    }
}

#Preview {
    RoomDjView()
}
