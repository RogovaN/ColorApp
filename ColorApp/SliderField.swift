//
//  SliderField.swift
//  ColorApp
//
//  Created by Наталья Рогова on 07.06.2021.
//

import SwiftUI

struct SliderField: View {
    @State private var alertPresented = false
    @Binding var value: Double
    let color: Color
    
    var body: some View {
        HStack {
            Text("\(lround(value))")
                .foregroundColor(.white)
            
            Slider(value: $value, in: 0...255, step: 1)
                .accentColor(color)
            ValidatedTextField(alertPresented: $alertPresented, value: $value)
            
            Spacer()
        }
        .padding()
    }
}

struct Slider_Previews: PreviewProvider {
    static var previews: some View {
        SliderField(value: .constant(30), color: .red)
    }
}

struct ValidatedTextField: View {
    @Binding var alertPresented: Bool
    @Binding var value: Double
    
    var body: some View {
        TextField("", text: Binding<String>(
            get: { String(Int(value)) },
            set: {
                if let v = NumberFormatter().number(from: $0) {
                    if (0...255).contains(v.doubleValue) {
                        value = v.doubleValue
                    } else {
                        alertPresented.toggle()
                        value = 0
                    }
                } else {
                    alertPresented.toggle()
                    value = 0
                }
            }
        ))
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .frame(width: 50)
        .alert(isPresented: $alertPresented) {
            Alert(title: Text("Invalid value"), message: Text("Please enter value from 0 to 255"))}
    }
}
