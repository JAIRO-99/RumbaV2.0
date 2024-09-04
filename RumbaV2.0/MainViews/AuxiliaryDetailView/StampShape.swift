//
//  StampShape.swift
//  RumbaV2.0
//
//  Created by Jairo Laurente Celis on 4/09/24.
//

import SwiftUI

struct StampShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        // Dibuja la forma de la huella
        path.addEllipse(in: CGRect(x: rect.midX - 120, y: rect.midY + 160, width: 250, height: 200))
        
       
        
        return path
    }
    
}
#Preview(body: {
    StampShape()
})
