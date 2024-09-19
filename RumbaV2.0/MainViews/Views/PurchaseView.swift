//
//  PurchaseView.swift
//  RumbaV2.0
//
//  Created by Jairo Laurente Celis on 3/09/24.
//

import SwiftUI

struct PurchaseView: View {
    
    @State private var isExpanded = false
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationView {
            ZStack{
                        Color("negro")
                            .edgesIgnoringSafeArea(.all)
                        VStack {
                            
                            Text("Amplia tu plan")
                                .font(.custom("Poppins-Bold", size: 30))
                                .foregroundColor(.white)
                            
                            + Text(" \n      Rumbero")
                                .font(.custom("Poppins-Bold", size: 30))
                                .foregroundColor(Color("celeste"))
                            
                            ScrollView{
                                PlanView(plan: .standard)
                                    .background(Color("negroClaro"))
                                    .cornerRadius(30)
                                    .padding(.bottom,15)
                                    .padding(.horizontal)
                                PlanView(plan: .pro)
                                    .background(Color("negroClaro"))
                                    .cornerRadius(30)
                                    .padding(.bottom,15)
                                    .padding(.horizontal)
                                PlanView(plan: .djPro)
                                    .background(Color("negroClaro"))
                                    .cornerRadius(30)
                                    .padding(.bottom,15)
                                    .padding(.horizontal)
                            }
                            
                        }
                    }
                    
           // .navigationBarBackButtonHidden(true)
        }
        
        
    }
}

struct PlanView: View {
    enum Plan {
        case standard, pro, djPro
        
        var title: String {
            switch self {
            case .standard: return "STANDARD"
            case .pro: return "PRO"
            case .djPro: return "DJ PRO"
            }
        }
        
        var color: Color {
            switch self {
            case .standard: return Color("standard")
            case .pro: return Color("pro")
            case .djPro: return Color("djPro")
            }
        }
        
        var details: [String] {
            switch self {
            case .standard:
                return ["Sincronización 10 usuarios", "Modo On-line 100%", "Entérate de ofertas","Acceso total a la aplicación","Interfaz intuitiva","Perfil activo","Comparte en tus redes sociales que estas rumbeando"]
            case .pro:
                return ["Sincronización 10 - 50 usuarios", "Chat grupal", "Compatibilidad Streaming","Ecualizador integrado", "Adios publicidad","Modo offline","Forma parte de RumbaWorld!","App personalizada: Escoge los colores y diseña tu app", "Comparte con tus amigos que estas rumbeando"]
            case .djPro:
                return ["Sincronización de +100 usuarios", "Ecualizador avanzado", "Compatibilidad Streaming audio y video", "Ecualizador integrado", "Adios publicidad", "Modo offline(10-20 usuarios)", "Forma parte del RumbaWordl!", "App personalizada: Escoge los colores y diseña tu app", "Consola de DJ Virtual", "Acceso a nuestra nube", "Modo Karaoke!" , "Rumba AI!"]
            }
        }
        var cost: [String] {
            switch self {
            case .standard:
                return ["$ 1.99","$ 1.49"]
            case .pro:
                return ["$ 3.00", "$ 6.99", "$ 19.99"]
            case .djPro:
                return ["$ 4.00", "$ 9.99", "$ 29.99"]
            }
        }
        var month: [String]{
            switch self {
            case .standard:
                return ["mes"]
            case .pro:
                return ["mes","3 mes", "1 año"]
            case .djPro:
                return ["mes","3 mes", "1 año"]
            }
        }
    }
    
    let plan: Plan
    @State private var showCompletePlan = false
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        HStack{
                            Text("Plan")
                                .font(.custom("Poppins-Bold", size: 25))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            
                            Text(plan.title)
                                .font(.custom("Poppins-Bold", size: 25))
                                .fontWeight(.bold)
                                .cornerRadius(5)
                                .foregroundColor(plan.color)
                            Spacer()
                            if plan == .standard || plan == .pro {
                                Button{
                                    // Acción de compra
                                } label: {
                                    Text("Compra")
                                        .font(.custom("Poppins-SemiBold", size: 15))
                                        .padding(5)
                                        .foregroundColor(.black)
                                        .background(Color("humo"))
                                        .cornerRadius(20)
                                }
                            }
                        }
                    }
                    Spacer()
                    
                    if plan == .djPro {
                        Text("Próximamente")
                            .font(.system(size: 10))
                            .fontWeight(.bold)
                            .frame(width: 87, height: 40)
                            .padding(.horizontal,10)
                            .background(Color("gris"))
                            .foregroundColor(.white)
                            .cornerRadius(20)
                    }
                }
                .padding()
            }
            // Mostrar detalles del plan
            VStack(alignment: .leading) {
                    ForEach(showCompletePlan ? plan.details : Array(plan.details.prefix(3)), id: \.self) { detail in
                        HStack{
                            Circle()
                                .frame(width: 12)
                                .foregroundColor(plan.color)
                            Text("\(detail)")
                                .font(.custom("Poppins-SemiBold", size: 15))
                                .padding(.vertical, 2)
                                .foregroundColor(Color.white)
                        }
                        
                    }
                // Botón para ver más/menos detalles
                VStack{
                    HStack(spacing: 30) {
                        Spacer()
                        ForEach(showCompletePlan ? plan.cost : Array(plan.cost.prefix(1)), id: \.self) { price in
                            HStack {
                                    if price != "$ 1.99"{
                                        Text("\(price)")
                                            .font(.custom("Poppins-SemiBold", size: 15))
                                            .foregroundColor(.black)
                                            .frame(width: 60)
                                            .background(plan.color)
                                            .cornerRadius(20)
                                    } else {
                                        
                                        VStack{
                                            Text("$ 1.99")
                                                .font(.custom("Poppins-SemiBold", size: 15))
                                                .foregroundColor(.white)
                                                .frame(width: 60)
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 20)
                                                        .stroke(Color("standard"), lineWidth: 1)
                                                )
                                                .background(Color.black)
                                            
                                            Text("Descuento por lanzamiento")
                                                .font(.custom("Poppins-SemiBold", size: 10))
                                                .foregroundColor(.white)
                                            
                                            ZStack{
                                                Rectangle()
                                                    .foregroundColor(.standard)
                                                    .offset(x:5, y: -35)
                                                    .rotationEffect(.degrees(-10))
                                                    .frame(width: 59, height: 2)
                                            }
                                        }
                                        
                                    }
                            }
                        }
                    }
                    HStack(spacing: 40){
                        Spacer()
                        ForEach(showCompletePlan ? plan.month : Array(plan.month.prefix(1)), id: \.self) { month in
                            
                            Text("\(month)")
                                .font(.custom("Poppins-Light", size: 12))
                                .foregroundColor(.white)
                                .padding(.trailing,15)
                        }
                    }
                    
                    HStack{
                        Spacer()
                        Button{
                            showCompletePlan.toggle()
                        }label:{
                            Text(showCompletePlan ? "Ver menos" : "Ver más")
                                .font(.system(size: 14))
                                .fontWeight(.bold)
                                .foregroundColor(plan.color)
                        }
                    }
                    .padding(.vertical,5)
                }
                
            }
            .padding(.horizontal)
        }
        .padding()
    }
}

#Preview {
    PurchaseView()
}
