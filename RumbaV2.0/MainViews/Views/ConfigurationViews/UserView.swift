//
//  UserView.swift
//  RumbaV2.0
//
//  Created by Jairo Laurente Celis on 19/09/24.
//

import SwiftUI

struct UserView: View {
    var body: some View {
        NavigationView{
            ZStack {
                Color("negro")
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    Text("Perfil")
                        .font(.custom("Poppins-Bold", size: 25))
                        .foregroundColor(.white)
                    
                    Image(systemName: "person")
                      
                        .resizable()
                        .padding(40)
                        .foregroundColor(.white)
                        .background(.gris)
                        .clipShape(Circle())
                        .frame(width: 200,height: 200)
                    
                    Button{
                        
                    }label: {
                        Text("CAMBIAR IMAGEN")
                            .font(.custom("Poppins-Light", size: 15))
                            .foregroundColor(.white)
                    }
                      
                }
            }
        }
    }
}

#Preview {
    UserView()
}
