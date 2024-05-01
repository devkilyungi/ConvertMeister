//
//  VolumeUnit.swift
//  ConvertMeister
//
//  Created by Victor Kilyungi on 01/05/2024.
//

import Foundation

enum VolumeUnit: String, CaseIterable {
    typealias UnitType = UnitVolume
    
    case milliliters = "Milliliters"
    case liters = "Liters"
    case cups = "Cups"
    case pints = "Pints"
    case gallons = "Gallons"
    
    var unitName: String {
        return self.rawValue
    }
    
    var unitShortHand: String {
        switch self {
        case .milliliters: return "ml"
        case .liters: return "l"
        case .cups: return "cups"
        case .pints: return "pints"
        case .gallons: return "gal"
        }
    }
    
    var unit: UnitVolume {
        switch self {
        case .milliliters: return .milliliters
        case .liters: return .liters
        case .cups: return .cups
        case .pints: return .pints
        case .gallons: return .gallons
        }
    }
}
