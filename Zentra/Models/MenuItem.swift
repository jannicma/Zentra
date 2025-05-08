//
//  MenuItem.swift
//  Zentra
//
//  Created by Jannic Marcon on 08.05.2025.
//
import Foundation

enum MenuItem: String, CaseIterable, Identifiable {
    var id: String { rawValue }
    
    case home = "house"
    case positionSizeCalculator = "flame.fill"
    case aaa = "megaphone.fill"
    case sdf = "magnifyingglass.circle.fill"
    case shdsfs = "info.triangle.fill"
    case hsdgsh = "staroflife.shield.fill"
    case hsdfse = "sofa.fill"
    case hsdfewss = "dollarsign.circle.fill"
    case gsd = "progress.indicator"
    case jrjr = "pencil"
}
