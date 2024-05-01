//
//  ConversionFunctions.swift
//  ConvertMeister
//
//  Created by Victor Kilyungi on 01/05/2024.
//

import Foundation

struct UnitConverter {
    static func convertLength(inputValue: Double, inputUnit: LengthUnit, outputUnit: LengthUnit) -> Double {
        let baseLength = Measurement(value: inputValue, unit: inputUnit.unit)
        return baseLength.converted(to: outputUnit.unit).value
    }
    
    static func convertTime(inputValue: Double, inputUnit: TimeUnit, outputUnit: TimeUnit) -> Double {
        let baseTime = Measurement(value: inputValue, unit: inputUnit.unit)
        return baseTime.converted(to: outputUnit.unit).value
    }
    
    static func convertTemperature(inputValue: Double, inputUnit: TemperatureUnit, outputUnit: TemperatureUnit) -> Double {
        let baseTemperature = Measurement(value: inputValue, unit: inputUnit.unit)
        return baseTemperature.converted(to: outputUnit.unit).value
    }
    
    static func convertVolume(inputValue: Double, inputUnit: VolumeUnit, outputUnit: VolumeUnit) -> Double {
        let baseVolume = Measurement(value: inputValue, unit: inputUnit.unit)
        return baseVolume.converted(to: outputUnit.unit).value
    }
    
    static func convertData(inputValue: Double, inputUnit: DataUnit, outputUnit: DataUnit) -> Double {
        let baseData = Measurement(value: inputValue, unit: inputUnit.unit)
        return baseData.converted(to: outputUnit.unit).value
    }
}
