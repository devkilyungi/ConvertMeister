//
//  InputSectionView.swift
//  ConvertMeister
//
//  Created by Victor Kilyungi on 01/05/2024.
//

import SwiftUI

struct InputSectionView: View {
    
    @Binding var inputValue: Double
    @Binding var selectedConversionType: ConversionType
    @Binding var selectedLengthInput: LengthUnit
    @Binding var selectedTimeInput: TimeUnit
    @Binding var selectedTemperatureInput: TemperatureUnit
    @Binding var selectedVolumeInput: VolumeUnit
    @Binding var selectedDataInput: DataUnit
    
    var body: some View {
        
        Section(header: Text("Input")) {
            
            switch selectedConversionType {
                
            case .length:
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
                
            case .time:
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
                
            case .temperature:
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
                
            case .volume:
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
                
            case .data:
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
        
    }
}

#Preview {
    InputSectionView(
        inputValue: .constant(0),
        selectedConversionType: .constant(ConversionType.length),
        selectedLengthInput: .constant(LengthUnit.meters),
        selectedTimeInput: .constant(TimeUnit.seconds),
        selectedTemperatureInput: .constant(TemperatureUnit.celsius),
        selectedVolumeInput: .constant(VolumeUnit.milliliters),
        selectedDataInput: .constant(DataUnit.bits)
    )
}
