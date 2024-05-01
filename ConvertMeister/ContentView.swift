//
//  ContentView.swift
//  ConvertMeister
//
//  Created by Victor Kilyungi on 01/05/2024.
//

import SwiftUI

enum ConversionType: String, CaseIterable {
    case length = "Length"
    case time = "Time"
    case temperature = "Temperature"
    case volume = "Volume"
}

enum LengthUnit: String, CaseIterable {
    case meters = "Meters"
    case kilometers = "Kilometers"
    case feet = "Feet"
    case yards = "Yards"
    case miles = "Miles"
    
    var unit: UnitLength {
        switch self {
        case .meters: return .meters
        case .kilometers: return .kilometers
        case .feet: return .feet
        case .yards: return .yards
        case .miles: return .miles
        }
    }
    
    var label: String {
        switch self {
        case .meters: return "m"
        case .kilometers: return "km"
        case .feet: return "ft"
        case .yards: return "yd"
        case .miles: return "mi"
        }
    }
}

struct ContentView: View {
    @State private var inputValue: Double = 0
    @State private var outputValue: Double = 0
    @State private var selectedConversionType = ConversionType.length
    @State private var selectedInputConversionType = LengthUnit.meters
    @State private var selectedOutputConversionType = LengthUnit.kilometers
    
    var body: some View {
        NavigationView {
            Form {
                Picker("Conversion Type:", selection: $selectedConversionType) {
                    ForEach(ConversionType.allCases, id: \.self) {
                        Text($0.rawValue)
                    }
                }
                .pickerStyle(.menu)
                
                Section(header: Text("Input")) {
                    Picker("Input Unit:", selection: $selectedInputConversionType) {
                        ForEach(LengthUnit.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                    .pickerStyle(.menu)
                    
                    HStack {
                        TextField("Input Value", value: $inputValue, format: .number)
                            .keyboardType(.decimalPad)
                        
                        Text(selectedInputConversionType.label)
                    }
                }
                
                Section(header: Text("Output")) {
                    Picker("Output Unit:", selection: $selectedOutputConversionType) {
                        ForEach(LengthUnit.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                    .pickerStyle(.menu)
                    
                    HStack{
                        TextField("Output Value", value: $outputValue, format: .number)
                            .keyboardType(.decimalPad)
                        
                        Text(selectedOutputConversionType.label)
                    }
                }
            }
            .navigationTitle("ConvertMeister")
            .onChange(of: inputValue, {
                convertValue()
            })
            .onChange(of: selectedInputConversionType, {
                convertValue()
            })
        }
    }
    
    private func convertValue() {
        switch selectedConversionType {
        case .length:
            outputValue = convertLength(inputValue: inputValue, inputUnit: selectedInputConversionType, outputUnit: selectedOutputConversionType)
        default:
            break
        }
    }
    
    private func convertLength(inputValue: Double, inputUnit: LengthUnit, outputUnit: LengthUnit) -> Double {
        let baseLength = Measurement(value: inputValue, unit: inputUnit.unit)
        return baseLength.converted(to: outputUnit.unit).value
    }
}

#Preview {
    ContentView()
}
