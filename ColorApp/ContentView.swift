//
//  ContentView.swift
//  ColorApp
//
//  Created by Наталья Рогова on 07.06.2021.
//

import SwiftUI

struct ContentView: View {
    @State private var red: Double = Double(Int.random(in: 0...255))
    @State private var green: Double = Double(Int.random(in: 0...255))
    @State private var blue: Double = Double(Int.random(in: 0...255))

    var body: some View {
        ZStack {
            Color.blue.opacity(0.8)
                .ignoresSafeArea()
            VStack {
                ColorPreview(red: red, green: green, blue: blue)
                SliderField(value: $red, color: .red)
                SliderField(value: $green, color: .green)
                SliderField(value: $blue, color: .blue)
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct ColorPreview: View {
    let red: Double
    let green: Double
    let blue: Double
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .foregroundColor(Color(red: red / 255, green: green / 255, blue: blue / 255))
            .frame(width: 330, height: 180)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(lineWidth: 3)
                    .foregroundColor(.white)
            )
    }
}
