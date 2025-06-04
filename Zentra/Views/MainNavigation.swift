//
//  ContentView.swift
//  Zentra
//
//  Created by Jannic Marcon on 08.05.2025.
//

import SwiftUI

struct MainNavigation: View {
    @State private var selectedMenuItem: MenuItem = .home
    
    var body: some View {
        GeometryReader{ _ in
            
            ZStack(alignment: .bottom) {
                Color(.systemGray6)
                    .ignoresSafeArea(edges: .all)
                
                Group {
                    switch selectedMenuItem {
                    case .home:
                        HomeView()
                    case .positionSizeCalculator:
                        PositionSizeCalculatorView()
                    case .performanceProjecting:
                        PerformanceProjectingView()
                    default:
                        Text("Page for \(selectedMenuItem.rawValue)")
                            .font(.largeTitle)
                            .padding()
                    }
                }
                .padding(.bottom, 100)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                HorizontalMenuBar(selectedMenuItem: $selectedMenuItem)
                    .padding(.bottom, 5)
                
            }
        }
        .ignoresSafeArea(.keyboard, edges: .all)
    }
}

#Preview {
    MainNavigation()
}
    
