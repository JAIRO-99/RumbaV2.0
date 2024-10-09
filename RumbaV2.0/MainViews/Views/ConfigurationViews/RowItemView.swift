//
//  RowItemView.swift
//  RumbaV2.0
//
//  Created by Jairo Laurente Celis on 30/09/24.
//

import SwiftUI

struct RowItemView: View {
    let option: SideMenuOptionModel
    @Binding var selectedOption: SideMenuOptionModel?
    
    private var isSelected: Bool {
        return selectedOption == option
    }
    var body: some View {
        HStack {
            Image(systemName: option.imageName)
                .imageScale(.small)
                
            
            Text(option.title)
                .font(.subheadline)
            
            Spacer()
            
            Image(systemName: "chevron.forward")
                .imageScale(.small)
        }
        .padding(.leading)
        .padding(.trailing)
        .foregroundColor(.black)
        .frame(width: 220, height: 48)
        .background(isSelected ? .gray.opacity(0.2) : .clear)
        .cornerRadius(20)
    }
}

#Preview {
    RowItemView(option: SideMenuOptionModel.perfil, selectedOption: .constant(.perfil))
}
