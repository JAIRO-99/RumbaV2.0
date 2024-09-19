//
//  LaunchScreenView.swift
//  RumbaV2.0
//
//  Created by Jairo Laurente Celis on 3/09/24.
//

import SwiftUI

struct LaunchScreenView: View {
    
    @State var  isPresented = false
    @State var endAnimation = false
    @State var index = 0.0
    
    var body: some View {
        
        ZStack{
            Color("negro")
                .edgesIgnoringSafeArea(.all)
            HStack {
                Image("rumba")
                    .resizable()
                    .renderingMode(.original)
                    .frame(width: 200, height: 200)
                    .scaleEffect(isPresented ? 1.2 : 0.7)
                    .animation(.easeIn(duration: 1), value: index)
            }
        }
        .onAppear(perform: {
            animationActive()
            isPresented.toggle()
            index = 0.5
        })
    }
    func animationActive(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
            withAnimation(Animation.easeOut(duration: 0.60)) {
                isPresented.toggle()
            }
            withAnimation(Animation.easeOut(duration: 0.20)){
                endAnimation.toggle()
            }
        }
    }
}

#Preview {
    LaunchScreenView()
}
