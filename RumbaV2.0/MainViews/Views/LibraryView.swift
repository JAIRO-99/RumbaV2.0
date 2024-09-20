//
//  UserView.swift
//  RumbaV2.0
//
//  Created by Jairo Laurente Celis on 3/09/24.
//

import SwiftUI

struct LibraryView: View {
    let columns = [GridItem(.adaptive(minimum: 120)),GridItem(.adaptive(minimum: 120)),GridItem(.adaptive(minimum: 120))]
    let gender = ["Pop", "Reggaeton", "Rock", "Clásica", "Jazz", "Reggae", "Cumbia", "Metal", "Latino", "Funk", "Electro", "R&B"]
    @State private var search = ""
    var body: some View {
       
            ZStack {
                Color("negro")
                    .edgesIgnoringSafeArea(.all)
                VStack(alignment: .leading){
                    
                    TextField("Añade canción a la cola", text: $search)
                    Text("Géneros")
                        .font(.custom("Poppins-Bold", size: 45))
                        .foregroundColor(.white)
                    
                    ScrollView (showsIndicators: false){
                        LazyVGrid(columns: columns){
                            ForEach(gender, id: \.self){ gender in
                                NavigationLink{
                                    EmptyView()
                                }label: {
                                    Text(gender)
                                        .font(.custom("Poppins-Bold", size: 15))
                                        .foregroundColor(.white)
                                        .frame(width: 115,height: 115)
                                        .background(colorsGender(gender: gender))
                                        .cornerRadius(25)
                                    
                                }
                            }
                        }
                    }
                    
                }
                .padding()
              //  .searchable(text: $search, prompt: "Añade canción a la cola")
                .foregroundColor(.white)
                
            }
        
    }
    func colorsGender(gender: String) -> Color {
        switch gender {
        case "Pop":
            return .rojiso
        case "Reggaeton":
            return .verdoso
        case "Rock":
               return .naranja
        case "Clásica":
            return .moradoOscuro
        case "Jazz":
            return .verdeClaro
        case "Reggae":
            return .moradoClaro
        case "Cumbia":
            return .celesteClaro
        case "Metal":
            return .marron
        case "Latino":
            return .pastel
        case "Funk":
            return .lila
        case "Electro":
            return .amarillo
        default:
            return .verdeOscuro
        }
    }
}

#Preview {
    LibraryView()
}
