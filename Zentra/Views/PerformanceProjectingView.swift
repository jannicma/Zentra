//
//  PerformanceProjectingView.swift
//  Zentra
//
//  Created by Jannic Marcon on 04.06.2025.
//

import SwiftUI
import Charts

struct PerformanceProjectingView: View {
    @StateObject private var viewModel = PerformanceProjectingViewModel()
    @FocusState private var isStartingAmountFocused: Bool
    @FocusState private var isRiskPercentageFocused: Bool
    @FocusState private var isRewardToRiskFocused: Bool
    @FocusState private var isWinRatePercentageFocused: Bool
    @FocusState private var isProjectedTradesFocused: Bool
    
    private let xAxisName: String = "# Trades"
    private let yAxisName: String = "Account Size"
    private let performanceGroupName: String = "Performance Type"
    
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
                    isStartingAmountFocused = false
                    isRiskPercentageFocused = false
                    isRewardToRiskFocused = false
                    isWinRatePercentageFocused = false
                    isProjectedTradesFocused = false
                    
                    viewModel.calculate()
                }
            
            VStack{
                Text("Performance Projecting")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(.top)
                
                Text("See how your funds will play out with a given performance.")
                    .padding()
                
                VStack{
                    LabeledNumberField(label: "Projected Trades", value: $viewModel.projectedTrades, labelWidth: 140)
                        .focused($isProjectedTradesFocused)
                    LabeledNumberField(label: "Start Amount", value: $viewModel.startingAmount, labelWidth: 140)
                        .focused($isStartingAmountFocused)
                    LabeledNumberField(label: "Risk %", value: $viewModel.riskPercentage, labelWidth: 140)
                        .focused($isRiskPercentageFocused)
                    LabeledNumberField(label: "Reward to Risk", value: $viewModel.rewardToRisk, labelWidth: 140)
                        .focused($isRewardToRiskFocused)
                    LabeledNumberField(label: "Win Rate", value: $viewModel.winRatePercentage, labelWidth: 140)
                        .focused($isWinRatePercentageFocused)
                }
                .padding(.horizontal, 30)
                
                Divider()
                    .padding()
                
                
                Chart(viewModel.performanceData){
                    LineMark(
                        x: .value(xAxisName, $0.tradeNumber),
                        y: .value(yAxisName, $0.projectedAmount)
                    )
                    .foregroundStyle(by: .value(performanceGroupName, $0.projectionType))
                }
                .chartYScale(domain: .automatic(includesZero: false))
                .chartXScale(domain: .automatic(includesZero: false))
                .padding(.horizontal)
                
                
                Spacer()
            }
            .ignoresSafeArea(.keyboard, edges: .all)

        }
    }
}

#Preview {
    PerformanceProjectingView()
}
