//
//  PositionSizeCalculatorView.swift
//  Zentra
//
//  Created by Jannic Marcon on 08.05.2025.
//

import SwiftUI

struct PositionSizeCalculatorView: View {
    @StateObject private var viewModel = PositionSizeCalculatorViewModel()
    @FocusState private var isEntryFocused: Bool
    @FocusState private var isStopLossFocused: Bool
    @FocusState private var isRiskFocused: Bool
    
    let numberFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    var body: some View {
        ZStack{
            Color(.systemGray6)
                .ignoresSafeArea(edges: .all)
                .onTapGesture {
                    isEntryFocused = false
                    isStopLossFocused = false
                    isRiskFocused = false

                    viewModel.calculatePositionSize()
                }
            
            VStack{
                Text("Calculate Position Size")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.top)
                
                Text("Here you can calculate your Position Size, based on the amount you are willing to risk.")
                    .padding()
                
                VStack{
                    LabeledNumberField(label: "Entry Price", value: $viewModel.entryPrice, labelWidth: 100)
                        .focused($isEntryFocused)
                    LabeledNumberField(label: "StopLoss", value: $viewModel.stopLossPrice, labelWidth: 100)
                        .focused($isStopLossFocused)
                    LabeledNumberField(label: "Risk", value: $viewModel.risk, labelWidth: 100)
                        .focused($isRiskFocused)
                }
                .padding(.horizontal, 30)
                
                Divider()
                    .padding()
                
                Text("Position Size: \(viewModel.positionSize)")
                
                
                Spacer()
            }
        }
    }
}

#Preview {
    PositionSizeCalculatorView()
}
