//
//  TabBarView.swift
//  RumbaV2.0
//
//  Created by Jairo Laurente Celis on 3/09/24.
//


import SwiftUI

struct DjCodeView: View {
    @Environment(\.dismiss) var dismiss
    @State private var showRoomDjView = false
    var body: some View {
        
        NavigationView {
            ZStack{
                Color("negro")
                    .edgesIgnoringSafeArea(.all)
                
                VStack{
                    ZStack(){
                        LinearGradient(colors: [Color("morado"), Color("celeste")], startPoint: .bottom, endPoint: .top)
                        Image("dj")
                            .resizable()
                            .frame(width: 300,height: 280)
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 400)
                    .cornerRadius(30)
                    
                    Text("9999")
                        .padding()
                        .padding(.horizontal,40)
                        .foregroundColor(.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke( LinearGradient(colors: [Color("morado"), Color("celeste")], startPoint: .bottom, endPoint: .top), lineWidth: 5)
                        )
                        .background(Color("negro"))
                        .cornerRadius(30)
                        .offset(y: -35)
                    
                    
                    VStack(alignment: .center){
                        Text("Ahora tu controlas la música, \n  comparte tu código")
                            .foregroundColor(.white)
                            .font(.system(size: 25))
                            .multilineTextAlignment(.center)
                        
                        Spacer()
                        Button{
                            showRoomDjView = true
                        }label:{
                            Text("Que empiece la rumba")
                                .padding(.horizontal,50)
                                .padding()
                                .foregroundColor(.black)
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                            
                        }
                        .background(LinearGradient(colors: [Color("morado"), Color("celeste")], startPoint: .bottom, endPoint: .top))
                        .cornerRadius(30)
                        Spacer()
                    }
                    
                }
                .edgesIgnoringSafeArea(.all)
                
            }
            .toolbar{
                ToolbarItem(placement: .topBarLeading){
                    Button{
                        dismiss()
                    }label: {
                        Image(systemName: "chevron.left")
                            .padding(10)
                            .background(.white)
                            .clipShape(Circle())
                    }
                }
            }
        }
        .fullScreenCover(isPresented: $showRoomDjView, content: {
            RoomDjView()
        })
        .navigationBarBackButtonHidden(true)
    }
}
#Preview {
    DjCodeView()
}
