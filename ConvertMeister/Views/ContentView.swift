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
                    } else if selectedConversionType == .temperature {
                        Picker("Input Unit:", selection: $selectedTemperatureInput) {
                            ForEach(TemperatureUnit.allCases, id: \.self) { temperatureUnit in
                                Text(temperatureUnit.unitName)
                            }
                        }
                        .pickerStyle(.menu)
                        
                        HStack {
                            TextField("Input Value", value: $inputValue, format: .number)
                                .keyboardType(.decimalPad)
                                .onAppear {
                                    inputValue = 0
                                }
                            
                            Text(selectedTemperatureInput.unitShortHand)
                        }
                    } else if selectedConversionType == .volume {
                        Picker("Input Unit:", selection: $selectedVolumeInput) {
                            ForEach(VolumeUnit.allCases, id: \.self) { volumeUnit in
                                Text(volumeUnit.unitName)
                            }
                        }
                        .pickerStyle(.menu)
                        
                        HStack {
                            TextField("Input Value", value: $inputValue, format: .number)
                                .keyboardType(.decimalPad)
                                .onAppear {
                                    inputValue = 0
                                }
                            
                            Text(selectedVolumeInput.unitShortHand)
                        }
                    } else {
                        Picker("Input Unit:", selection: $selectedDataInput) {
                            ForEach(DataUnit.allCases, id: \.self) { dataUnit in
                                Text(dataUnit.unitName)
                            }
                        }
                        .pickerStyle(.menu)
                        
                        HStack {
                            TextField("Input Value", value: $inputValue, format: .number)
                                .keyboardType(.decimalPad)
                                .onAppear {
                                    inputValue = 0
                                }
                            
                            Text(selectedDataInput.unitShortHand)
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
                    } else if selectedConversionType == .temperature {
                        Picker("Output Unit:", selection: $selectedTemperatureOutput) {
                            ForEach(TemperatureUnit.allCases, id: \.self) { temperatureUnit in
                                Text(temperatureUnit.unitName)
                            }
                        }
                        .pickerStyle(.menu)
                        
                        HStack {
                            TextField("Output Value", value: $outputValue, format: .number)
                                .keyboardType(.decimalPad)
                                .onAppear {
                                    outputValue = 0
                                }
                            
                            Text(selectedTemperatureOutput.unitShortHand)
                        }
                    } else if selectedConversionType == .volume {
                        Picker("Output Unit:", selection: $selectedVolumeOutput) {
                            ForEach(VolumeUnit.allCases, id: \.self) { volumeUnit in
                                Text(volumeUnit.unitName)
                            }
                        }
                        .pickerStyle(.menu)
                        
                        HStack {
                            TextField("Output Value", value: $outputValue, format: .number)
                                .keyboardType(.decimalPad)
                                .onAppear {
                                    outputValue = 0
                                }
                            
                            Text(selectedVolumeOutput.unitShortHand)
                        }
                    } else {
                        Picker("Output Unit:", selection: $selectedDataOutput) {
                            ForEach(DataUnit.allCases, id: \.self) { dataUnit in
                                Text(dataUnit.unitName)
                            }
                        }
                        .pickerStyle(.menu)
                        
                        HStack {
                            TextField("Output Value", value: $outputValue, format: .number)
                                .keyboardType(.decimalPad)
                                .onAppear {
                                    outputValue = 0
                                }
                            
                            Text(selectedDataOutput.unitShortHand)
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
            outputValue = convertLength(inputValue: inputValue, inputUnit: selectedLengthInput, outputUnit: selectedLengthOutput)
        case .time:
            outputValue = convertTime(inputValue: inputValue, inputUnit: selectedTimeInput, outputUnit: selectedTimeOutput)
        case .temperature:
            outputValue = convertTemperature(inputValue: inputValue, inputUnit: selectedTemperatureInput, outputUnit: selectedTemperatureOutput)
        case .volume:
            outputValue = convertVolume(inputValue: inputValue, inputUnit: selectedVolumeInput, outputUnit: selectedVolumeOutput)
        case .data:
            outputValue = convertData(inputValue: inputValue, inputUnit: selectedDataInput, outputUnit: selectedDataOutput)
        }
    }
    
    private func updateInputValueFromOutput() {
        switch selectedConversionType {
        case .length:
            inputValue = convertLength(inputValue: outputValue, inputUnit: selectedLengthOutput, outputUnit: selectedLengthInput)
        case .time:
            inputValue = convertTime(inputValue: outputValue, inputUnit: selectedTimeOutput, outputUnit: selectedTimeInput)
        case .temperature:
            inputValue = convertTemperature(inputValue: outputValue, inputUnit: selectedTemperatureOutput, outputUnit: selectedTemperatureInput)
        case .volume:
            inputValue = convertVolume(inputValue: outputValue, inputUnit: selectedVolumeOutput, outputUnit: selectedVolumeInput)
        case .data:
            inputValue = convertData(inputValue: outputValue, inputUnit: selectedDataOutput, outputUnit: selectedDataInput)
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
    
    private func convertTemperature(inputValue: Double, inputUnit: TemperatureUnit, outputUnit: TemperatureUnit) -> Double {
        let baseTemperature = Measurement(value: inputValue, unit: inputUnit.unit)
        return baseTemperature.converted(to: outputUnit.unit).value
    }
    
    private func convertVolume(inputValue: Double, inputUnit: VolumeUnit, outputUnit: VolumeUnit) -> Double {
        let baseVolume = Measurement(value: inputValue, unit: inputUnit.unit)
        return baseVolume.converted(to: outputUnit.unit).value
    }
    
    func convertData(inputValue: Double, inputUnit: DataUnit, outputUnit: DataUnit) -> Double {
        let baseData = Measurement(value: inputValue, unit: inputUnit.unit)
        return baseData.converted(to: outputUnit.unit).value
    }
}

#Preview {
    ContentView()
}
