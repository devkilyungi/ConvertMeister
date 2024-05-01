//
//  TimeUnit.swift
//  ConvertMeister
//
//  Created by Victor Kilyungi on 01/05/2024.
//

import Foundation

enum TimeUnit: String, CaseIterable, ConversionUnit {
    typealias UnitType = UnitDuration
    
    case seconds = "Seconds"
    case minutes = "Minutes"
    case hours = "Hours"
    
    var unitName: String {
        return self.rawValue
    }
    
    var unitShortHand: String {
        switch self {
        case .seconds: return "s"
        case .minutes: return "m"
        case .hours: return "h"
        }
    }
    
    var unit: UnitDuration {
        switch self {
        case .seconds: return .seconds
        case .minutes: return .minutes
        case .hours: return .hours
        }
    }
}
