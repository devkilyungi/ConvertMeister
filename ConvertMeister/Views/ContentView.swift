//
//  ContentView.swift
//  ConvertMeister
//
//  Created by Victor Kilyungi on 01/05/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var inputValue: Double = 0
    @State private var outputValue: Double = 0
    @State private var selectedConversionType = ConversionType.length
    
    @State private var selectedLengthInput = LengthUnit.meters
    @State private var selectedLengthOutput = LengthUnit.kilometers
    
    @State private var selectedTimeInput = TimeUnit.seconds
    @State private var selectedTimeOutput = TimeUnit.minutes
    
    @State private var selectedTemperatureInput = TemperatureUnit.celsius
    @State private var selectedTemperatureOutput = TemperatureUnit.fahrenheit
    
    @State private var selectedVolumeInput = VolumeUnit.milliliters
    @State private var selectedVolumeOutput = VolumeUnit.liters
    
    @State private var selectedDataInput = DataUnit.bits
    @State private var selectedDataOutput = DataUnit.bytes
    
    var body: some View {
        
        NavigationView {
            Form {
                ConversionTypePicker(selectedConversionType: $selectedConversionType)
                
                InputSectionView(
                    inputValue: $inputValue,
                    selectedConversionType: $selectedConversionType,
                    selectedLengthInput: $selectedLengthInput,
                    selectedTimeInput: $selectedTimeInput,
                    selectedTemperatureInput: $selectedTemperatureInput,
                    selectedVolumeInput: $selectedVolumeInput,
                    selectedDataInput: $selectedDataInput
                )
                
                OutputSectionView(
                    outputValue: $outputValue,
                    selectedConversionType: $selectedConversionType,
                    selectedLengthOutput: $selectedLengthOutput,
                    selectedTimeOutput: $selectedTimeOutput,
                    selectedTemperatureOutput: $selectedTemperatureOutput,
                    selectedVolumeOutput: $selectedVolumeOutput,
                    selectedDataOutput: $selectedDataOutput
                )
                
                Section(header: Text("App Information")) {
                    VStack(alignment: .leading) {
                        Text("Version: v1.0.0")
                            .foregroundColor(.gray)
                            .font(.footnote)
                        
                        Text("ConvertMeister")
                            .font(.headline)
                        
                        Text("A simple unit conversion app")
                            .font(.subheadline)
                            .foregroundColor(.secondary)
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
            .onChange(of: selectedTemperatureInput, {
                updateInputValueFromOutput()
            })
            .onChange(of: selectedTemperatureOutput, {
                convertValue()
            })
            .onChange(of: selectedVolumeInput, {
                updateInputValueFromOutput()
            })
            .onChange(of: selectedVolumeOutput, {
                convertValue()
            })
            .onChange(of: selectedDataInput, {
                updateInputValueFromOutput()
            })
            .onChange(of: selectedDataOutput, {
                convertValue()
            })
        }
    }
    
    private func convertValue() {
        
        switch selectedConversionType {
            
        case .length:
            outputValue = UnitConverter.convertLength(inputValue: inputValue, inputUnit: selectedLengthInput, outputUnit: selectedLengthOutput)
            
        case .time:
            outputValue = UnitConverter.convertTime(inputValue: inputValue, inputUnit: selectedTimeInput, outputUnit: selectedTimeOutput)
            
        case .temperature:
            outputValue = UnitConverter.convertTemperature(inputValue: inputValue, inputUnit: selectedTemperatureInput, outputUnit: selectedTemperatureOutput)
            
        case .volume:
            outputValue = UnitConverter.convertVolume(inputValue: inputValue, inputUnit: selectedVolumeInput, outputUnit: selectedVolumeOutput)
            
        case .data:
            outputValue = UnitConverter.convertData(inputValue: inputValue, inputUnit: selectedDataInput, outputUnit: selectedDataOutput)
        }
    }
    
    private func updateInputValueFromOutput() {
        
        switch selectedConversionType {
            
        case .length:
            inputValue = UnitConverter.convertLength(inputValue: outputValue, inputUnit: selectedLengthOutput, outputUnit: selectedLengthInput)
            
        case .time:
            inputValue = UnitConverter.convertTime(inputValue: outputValue, inputUnit: selectedTimeOutput, outputUnit: selectedTimeInput)
            
        case .temperature:
            inputValue = UnitConverter.convertTemperature(inputValue: outputValue, inputUnit: selectedTemperatureOutput, outputUnit: selectedTemperatureInput)
            
        case .volume:
            inputValue = UnitConverter.convertVolume(inputValue: outputValue, inputUnit: selectedVolumeOutput, outputUnit: selectedVolumeInput)
            
        case .data:
            inputValue = UnitConverter.convertData(inputValue: outputValue, inputUnit: selectedDataOutput, outputUnit: selectedDataInput)
        }
    }
}

#Preview {
    ContentView()
}
