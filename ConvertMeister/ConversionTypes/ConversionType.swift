//
//  ConversionType.swift
//  ConvertMeister
//
//  Created by Victor Kilyungi on 01/05/2024.
//

import Foundation

protocol ConversionUnit {
    associatedtype UnitType: Dimension
    
    var unitName: String { get }
    var unitShortHand: String { get }
    var unit: UnitType { get }
}

enum ConversionType: String, CaseIterable {
    case length = "Length"
    case time = "Time"
    case temperature = "Temperature"
    case volume = "Volume"
    case data = "Data"
}
