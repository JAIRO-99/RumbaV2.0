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
        
        // Dibuja la forma del rectángulo
        let rectangle = CGRect(x: rect.midX - 200, y: rect.midY - 100, width: 400, height: 300)
        path.addRect(rectangle)
        
        return path
    }
}
#Preview(body: {
    StampShape()
})
