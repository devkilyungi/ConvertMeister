//
//  OutputSectionView.swift
//  ConvertMeister
//
//  Created by Victor Kilyungi on 01/05/2024.
//

import SwiftUI

struct OutputSectionView: View {
    
    @Binding var outputValue: Double
    @Binding var selectedConversionType: ConversionType
    @Binding var selectedLengthOutput: LengthUnit
    @Binding var selectedTimeOutput: TimeUnit
    @Binding var selectedTemperatureOutput: TemperatureUnit
    @Binding var selectedVolumeOutput: VolumeUnit
    @Binding var selectedDataOutput: DataUnit
    
    var body: some View {
        
        Section(header: Text("Output")) {
            
            switch selectedConversionType {
                
            case .length:
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
                
            case .time:
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
                
            case .temperature:
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
                
            case .volume:
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
                
            case .data:
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
}

#Preview {
    OutputSectionView(
        outputValue: .constant(0),
        selectedConversionType: .constant(ConversionType.length),
        selectedLengthOutput: .constant(LengthUnit.meters),
        selectedTimeOutput: .constant(TimeUnit.seconds),
        selectedTemperatureOutput: .constant(TemperatureUnit.celsius),
        selectedVolumeOutput: .constant(VolumeUnit.milliliters),
        selectedDataOutput: .constant(DataUnit.bits)
    )
}
