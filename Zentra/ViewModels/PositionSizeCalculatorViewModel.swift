//
//  PositionSizeCalculatorViewModel.swift
//  Zentra
//
//  Created by Jannic Marcon on 08.05.2025.
//
import Foundation

public class PositionSizeCalculatorViewModel: ObservableObject{
    @Published var entryPrice: Double = 0
    @Published var stopLossPrice: Double = 0
    @Published var risk: Double = 0
    
    @Published var positionSize: Double = 0
    
    public func calculatePositionSize() {
        let difference = abs(entryPrice - stopLossPrice)
        positionSize = risk / (difference > 0 ? difference : 1)
    }
}
