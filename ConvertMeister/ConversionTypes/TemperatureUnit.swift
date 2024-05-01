//
//  TemperatureUnit.swift
//  ConvertMeister
//
//  Created by Victor Kilyungi on 01/05/2024.
//

import Foundation

enum TemperatureUnit: String, CaseIterable {
    typealias UnitType = UnitTemperature
    
    case kelvin = "Kelvin"
    case celsius = "Celsius"
    case fahrenheit = "Fahrenheit"
    
    var unitName: String {
        return self.rawValue
    }
    
    var unitShortHand: String {
        switch self {
        case .kelvin: return "K"
        case .celsius: return "°C"
        case .fahrenheit: return "°F"
        }
    }
    
    var unit: UnitTemperature {
        switch self {
        case .kelvin: return .kelvin
        case .celsius: return .celsius
        case .fahrenheit: return .fahrenheit
        }
    }
}
