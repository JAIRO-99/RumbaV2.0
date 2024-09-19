//
//  HomeView.swift
//  RumbaV2.0
//
//  Created by Jairo Laurente Celis on 3/09/24.
//

import SwiftUI

struct HomeView: View {
    @State private var showCustomerView = false
    var body: some View {
        NavigationView{
            ZStack {
                Color("negro")
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    VStack{
                        Text("Qué tipo de \n rumbero eres?")
                            .foregroundColor(.white)
                            .font(.system(size: 30))
                            .fontWeight(.bold)
                           .multilineTextAlignment(.center)
                        
                        Text("Escoge tu modo")
                            .foregroundColor(.white)
                            .font(.system(size: 15))
                            .fontWeight(.bold)
                            .offset(x:-90,y:20)
                        VStack{
                            ZStack {
                                LinearGradient(colors: [Color("morado"), Color("celeste")], startPoint: .bottom, endPoint: .top)
                                Image("dj")
                                    .resizable()
                                    .frame(width: 200,height: 200)
                                    .rotationEffect(.degrees(-5))
                                    .offset(x: -20)
                                VStack {
                                    Spacer()
                                    ZStack{
                                        HStack{
                                            Text("Controla la \n música")
                                                .foregroundColor(.white)
                                                .font(.system(size: 25))
                                                .fontWeight(.bold)
                                            
                                            Spacer()
                                            NavigationLink{
                                                DjCodeView()
                                            }label: {
                                                Image(systemName: "chevron.right")
                                                    .frame(width: 40,height: 40)
                                                    .foregroundColor(.black)
                                                    .background(.white)
                                                    .clipShape(Circle())
                                            }
                                            .padding()
                                            
                                        }
                                        .padding()
                                        
                                        
                                        
                                    }
                                }
                            }
                            
                            .frame(width: 320,height: 220)
                            .cornerRadius(30)
                            .padding(.vertical,30)
                            
                            ZStack {
                                LinearGradient(colors: [Color("verde"), Color("celeste")], startPoint: .bottom, endPoint: .top)
                                Image("cliente")
                                    .resizable()
                                    .frame(width: 200,height: 200)
                                    .rotationEffect(.degrees(-5))
                                VStack {
                                    Spacer()
                                    ZStack{
                                        HStack{
                                            Text("Escucha la \n música")
                                                .foregroundColor(.white)
                                                .font(.system(size: 25))
                                                .fontWeight(.bold)
                                            
                                            Spacer()
                                            
                                            Button{
                                                showCustomerView = true
                                            }label: {
                                                Image(systemName: "chevron.right")
                                                    .frame(width: 40,height: 40)
                                                    .foregroundColor(.black)
                                                    .background(.white)
                                                    .clipShape(Circle())
                                                
                                            }
                                            .padding()
                                            
                                        }
                                        .padding()
                                        
                                        
                                        
                                    }
                                }
                            }
                            
                            .frame(width: 320,height: 220)
                            .cornerRadius(30)
                        }
                    }
                    Spacer()
                }
            }
            .toolbar{
                ToolbarItem(placement: .topBarTrailing){
                    HStack{
                        Button{
                            
                        }label:{
                            Image(systemName: "bell")
                                .resizable()
                                .frame(width: 25,height: 25)
                                .foregroundColor(.white)
                            
                                .padding()
                        }
                        NavigationLink{
                            ConfigurationView()
                        }label:{
                            Image(systemName: "gearshape")
                                .resizable()
                                .frame(width: 25,height: 25)
                                .foregroundColor(.white)
                        }
                    }
                    .padding()
                }
            }
            .fullScreenCover(isPresented: $showCustomerView, content: {
                CustomerCodeView(dismissView: $showCustomerView)
            })
        }
    }
}

#Preview {
    HomeView()
}
