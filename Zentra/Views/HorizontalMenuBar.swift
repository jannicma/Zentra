//
//  HorizontalMenuBar.swift
//  Zentra
//
//  Created by Jannic Marcon on 08.05.2025.
//

import SwiftUI

struct HorizontalMenuBar: View {
    @Binding var selectedMenuItem: MenuItem
    
    var body: some View{
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 25){
                ForEach(MenuItem.allCases){ menuItem in
                    Button(action: {
                        selectedMenuItem = menuItem
                    }){
                        Image(systemName: menuItem.rawValue)
                            .font(.system(size: 20, weight: .medium))
                            .foregroundStyle(selectedMenuItem == menuItem ? .blue : .primary)
                            .padding()
                            .background(selectedMenuItem == menuItem ? Color.blue.opacity(0.2) : Color.gray.opacity(0.2))
                            .clipShape(Circle())
                    }
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 10)
        }
        .background(Color(.systemGray4))
        .cornerRadius(20)
        .padding()
    }
}


#Preview {
    HorizontalMenuBar(selectedMenuItem: .constant(MenuItem.positionSizeCalculator))
}
