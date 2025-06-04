//
//  PerformanceProjectingViewModel.swift
//  Zentra
//
//  Created by Jannic Marcon on 04.06.2025.
//
import Foundation

public class PerformanceProjectingViewModel: ObservableObject{
    @Published var startingAmount: Double = 100
    @Published var riskPercentage: Double = 1
    @Published var rewardToRisk: Double = 2
    @Published var winRatePercentage: Double = 0.5
    @Published var projectedTrades: Double = 100
    
    @Published var performanceData: [PerformanceProjectingModel] = []
    
    public func calculate(){
        performanceData = []

        var projectedAverageAmount: Double = startingAmount
        var projectedRandomAmount: Double = startingAmount
        for i in 1...Int(projectedTrades){
            let riskAmount = projectedAverageAmount * (riskPercentage / 100)
            
            let winAmount = riskAmount * rewardToRisk
            let lossAmount = riskAmount
            
            //average
            let avgWinning = winAmount * winRatePercentage
            let avgLosing = lossAmount * (1 - winRatePercentage)
            let expectedProfit = avgWinning - avgLosing
            
            projectedAverageAmount += expectedProfit
            performanceData.append(PerformanceProjectingModel(id: "Average\(i)", projectionType: "Average", tradeNumber: i, projectedAmount: projectedAverageAmount))
            
            //random
            let change = Double.random(in: 0...1) <= winRatePercentage ? winAmount : -lossAmount
            projectedRandomAmount += change
            performanceData.append(PerformanceProjectingModel(id: "Random\(i)", projectionType: "Random", tradeNumber: i, projectedAmount: projectedRandomAmount))
        }
    }
}
