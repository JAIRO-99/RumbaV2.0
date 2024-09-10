//
//  PurchaseView.swift
//  RumbaV2.0
//
//  Created by Jairo Laurente Celis on 3/09/24.
//

import SwiftUI

struct PurchaseView: View {
    @State private var showCard = false

       var body: some View {
           
           VStack{
               if showCard{
                   CardView(title: "Plan Standard", description: "Plan de 1 año", plan: 1)
                   
                       .transition(.move(edge: .leading))
                   
                   CardView(title: "Plan Standard", description: "Plan de 1 año", plan: 1)
                       .transition(.move(edge: .leading))
                   
                   
                   CardView(title: "Plan Standard", description: "Plan de 1 año", plan: 1)
                       .transition(.move(edge: .leading))
               }
               }
           .padding()
           .onAppear{
               withAnimation{
                   showCard = true
               }
           }
          
       }
}

struct CardView: View {
    var title: String
    var description: String
    var plan: Int
    
    var body: some View {
        HStack{
            HStack{
                VStack{
                    Text(title)
                        .font(.system(size: 20).bold())
                    
                    Text(description)
                        .font(.system(size: 10))
                }
                .padding()
                Spacer()
                Text("$")
                Text("\(plan)")
                    .font(.system(size: 30).bold())
                
                    .padding(.trailing)
            }
            .padding(.vertical,30)
        }
        
        .background(Color("negro"))
        .foregroundColor(Color("celeste"))
        .cornerRadius(10)
    }
}

#Preview {
    PurchaseView()
}
