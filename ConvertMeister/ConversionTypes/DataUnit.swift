//
//  DataUnit.swift
//  ConvertMeister
//
//  Created by Victor Kilyungi on 01/05/2024.
//

import Foundation

enum DataUnit: String, CaseIterable {
    typealias UnitType = UnitInformationStorage
    
    case bits = "Bits"
    case bytes = "Bytes"
    case kilobytes = "Kilobytes"
    case megabytes = "Megabytes"
    case gigabytes = "Gigabytes"
    case terabytes = "Terabytes"
    
    var unitName: String {
        return self.rawValue
    }
    
    var unitShortHand: String {
        switch self {
        case .bits: return "b"
        case .bytes: return "B"
        case .kilobytes: return "KB"
        case .megabytes: return "MB"
        case .gigabytes: return "GB"
        case .terabytes: return "TB"
        }
    }
    
    var unit: UnitInformationStorage {
        switch self {
        case .bits: return .bits
        case .bytes: return .bytes
        case .kilobytes: return .kilobytes
        case .megabytes: return .megabytes
        case .gigabytes: return .gigabytes
        case .terabytes: return .terabytes
        }
    }
}
