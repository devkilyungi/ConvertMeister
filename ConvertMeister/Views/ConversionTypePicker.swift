//
//  ConversionTypePicker.swift
//  ConvertMeister
//
//  Created by Victor Kilyungi on 01/05/2024.
//

import SwiftUI

struct ConversionTypePicker: View {
    
    @Binding var selectedConversionType: ConversionType
    
    var body: some View {
        
        Picker("Conversion Type:", selection: $selectedConversionType) {
            ForEach(ConversionType.allCases, id: \.self) {
                Text($0.rawValue)
            }
        }
        .pickerStyle(.menu)
    }
}

#Preview {
    ConversionTypePicker(
        selectedConversionType: .constant(ConversionType.length))
    
}
