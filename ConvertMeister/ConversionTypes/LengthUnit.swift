//
//  LengthUnit.swift
//  ConvertMeister
//
//  Created by Victor Kilyungi on 01/05/2024.
//

import Foundation

enum LengthUnit: String, CaseIterable, ConversionUnit {
    typealias UnitType = UnitLength
    
    case meters = "Meters"
    case kilometers = "Kilometers"
    case feet = "Feet"
    case yards = "Yards"
    case miles = "Miles"
    
    var unitName: String {
        return self.rawValue
    }
    
    var unitShortHand: String {
        switch self {
        case .meters: return "m"
        case .kilometers: return "km"
        case .feet: return "ft"
        case .yards: return "yd"
        case .miles: return "mi"
        }
    }
    
    var unit: UnitLength {
        switch self {
        case .meters: return .meters
        case .kilometers: return .kilometers
        case .feet: return .feet
        case .yards: return .yards
        case .miles: return .miles
        }
    }
}
