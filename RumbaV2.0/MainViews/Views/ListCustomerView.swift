//
//  ListCustomerView.swift
//  RumbaV2.0
//
//  Created by Jairo Laurente Celis on 20/09/24.
//

import SwiftUI

struct ListCustomerView: View {
    @Environment(\.dismiss) var dismiss
    @State private var showAnimationView = false
    var body: some View {
        NavigationView{
            ZStack {
                Color("negro")
                    .edgesIgnoringSafeArea(.all)
                VStack {
                    VStack(alignment: .leading){
                        
                        HStack{
                            Text("Lista de invitados")
                                .font(.custom("Poppins-Light",size: 15))
                                .foregroundColor(Color("celeste"))
                            Spacer()
                        }
                        Text("Rumberos")
                            .font(.custom("Poppins-Bold", size: 30))
                            .foregroundColor(Color.white)
                        
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
                    }
                    .padding()
                    .padding(.horizontal)
                    VStack{
                        HStack{
                            Image(systemName: "person")
                                .resizable()
                                .frame(width: 50,height: 50)
                                .foregroundColor(.blue)
                            VStack{
                                Text("Panchito 123")
                                    .font(.custom("Poppins-SemiBold", size: 18))
                                    .foregroundColor(Color.white)
                                
                                Text("Anfitrión")
                                    .font(.custom("Poppins-Light", size: 15))
                                    .foregroundColor(Color("celeste"))
                                
                            }
                            Spacer()
                        }
                        .padding()
                        
                        List{
                            ForEach(0..<4){guests in
                                HStack{
                                    Image(systemName: "person")
                                        .resizable()
                                        .frame(width: 50,height: 50)
                                        .foregroundColor(.blue)
                                    VStack{
                                        Text("Panchito 123")
                                            .font(.custom("Poppins-SemiBold", size: 18))
                                            .foregroundColor(Color.white)
                                    }
                                    Spacer()
                                }
                                .listRowBackground(Color.black)
                            }
                        }
                        .listStyle(.plain)
                        
                    }
                }
            }
            .toolbar{
                ToolbarItem{
                    VStack(alignment: .center){
                        HStack{
                            Image(systemName: "person.2.fill")
                                .foregroundColor(.white)
                            Text("6/10")
                                .font(.custom("Poppins-SemiBold", size: 18))
                                .foregroundColor(.white)
                        }
                        Text("más espacio")
                            .font(.custom("Poppins-SemiBold", size: 13))
                            .foregroundColor(Color("celeste"))
                    }
                }
            }
            .toolbar{
                ToolbarItem(placement: .topBarLeading){
                    Button{
                        dismiss()
                    }label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                    showAnimationView = true
                }
            }
            .fullScreenCover(isPresented: $showAnimationView) {
                RAnimationView()
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    ListCustomerView()
}
