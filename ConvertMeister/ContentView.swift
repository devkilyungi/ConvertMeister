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
//    case temperature = "Temperature"
//    case volume = "Volume"
}

protocol ConversionUnit {
    associatedtype UnitType: Dimension
    
    var unitName: String { get }
    var unitShortHand: String { get }
    var unit: UnitType { get }
}

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

struct ContentView: View {
    @State private var inputValue: Double = 0
    @State private var outputValue: Double = 0
    @State private var selectedConversionType = ConversionType.length
    
    @State private var selectedLengthInput = LengthUnit.meters
    @State private var selectedLengthOutput = LengthUnit.kilometers
    
    @State private var selectedTimeInput = TimeUnit.seconds
    @State private var selectedTimeOutput = TimeUnit.minutes
    
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
                    if selectedConversionType == .length {
                        Picker("Input Unit:", selection: $selectedLengthInput) {
                            ForEach(LengthUnit.allCases, id: \.self) { lengthUnit in
                                Text(lengthUnit.unitName)
                            }
                        }
                        .pickerStyle(.menu)
                        
                        HStack {
                            TextField("Input Value", value: $inputValue, format: .number)
                                .keyboardType(.decimalPad)
                                .onAppear {
                                    inputValue = 0
                                }
                            
                            Text(selectedLengthInput.unitShortHand)
                        }
                    } else if selectedConversionType == .time {
                        Picker("Input Unit:", selection: $selectedTimeInput) {
                            ForEach(TimeUnit.allCases, id: \.self) { timeUnit in
                                Text(timeUnit.unitName)
                            }
                        }
                        .pickerStyle(.menu)
                        
                        HStack {
                            TextField("Input Value", value: $inputValue, format: .number)
                                .keyboardType(.decimalPad)
                                .onAppear {
                                    inputValue = 0
                                }
                            
                            Text(selectedTimeInput.unitShortHand)
                        }
                    }
                }
                
                Section(header: Text("Output")) {
                    if selectedConversionType == .length {
                        Picker("Output Unit:", selection: $selectedLengthOutput) {
                            ForEach(LengthUnit.allCases, id: \.self) { lengthUnit in
                                Text(lengthUnit.unitName)
                            }
                        }
                        .pickerStyle(.menu)
                        
                        HStack {
                            TextField("Output Value", value: $outputValue, format: .number)
                                .keyboardType(.decimalPad)
                                .onAppear {
                                    outputValue = 0
                                }
                            
                            Text(selectedLengthOutput.unitShortHand)
                        }
                    } else if selectedConversionType == .time {
                        Picker("Output Unit:", selection: $selectedTimeOutput) {
                            ForEach(TimeUnit.allCases, id: \.self) { timeUnit in
                                Text(timeUnit.unitName)
                            }
                        }
                        .pickerStyle(.menu)
                        
                        HStack {
                            TextField("Output Value", value: $outputValue, format: .number)
                                .keyboardType(.decimalPad)
                                .onAppear {
                                    outputValue = 0
                                }
                            
                            Text(selectedTimeOutput.unitShortHand)
                        }
                    }
                }
            }
            .navigationTitle("ConvertMeister")
            .onChange(of: inputValue, {
                convertValue()
            })
            .onChange(of: outputValue, {
                updateInputValueFromOutput()
            })
            .onChange(of: selectedLengthInput, {
                updateInputValueFromOutput()
            })
            .onChange(of: selectedLengthOutput, {
                convertValue()
            })
            .onChange(of: selectedTimeInput, {
                updateInputValueFromOutput()
            })
            .onChange(of: selectedTimeOutput, {
                convertValue()
            })
        }
    }
    
    private func convertValue() {
        switch selectedConversionType {
        case .length:
            outputValue = convertLength(inputValue: inputValue, inputUnit: selectedLengthInput, outputUnit: selectedLengthOutput)
        case .time:
            outputValue = convertTime(inputValue: inputValue, inputUnit: selectedTimeInput, outputUnit: selectedTimeOutput)
        }
    }
    
    private func updateInputValueFromOutput() {
        switch selectedConversionType {
        case .length:
            inputValue = convertLength(inputValue: outputValue, inputUnit: selectedLengthOutput, outputUnit: selectedLengthInput)
        case .time:
            inputValue = convertTime(inputValue: outputValue, inputUnit: selectedTimeOutput, outputUnit: selectedTimeInput)
        }
    }
    
    private func convertLength(inputValue: Double, inputUnit: LengthUnit, outputUnit: LengthUnit) -> Double {
        let baseLength = Measurement(value: inputValue, unit: inputUnit.unit)
        return baseLength.converted(to: outputUnit.unit).value
    }
    
    private func convertTime(inputValue: Double, inputUnit: TimeUnit, outputUnit: TimeUnit) -> Double {
        let baseTime = Measurement(value: inputValue, unit: inputUnit.unit)
        return baseTime.converted(to: outputUnit.unit).value
    }
}

#Preview {
    ContentView()
}
