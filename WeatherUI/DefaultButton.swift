//
//  DefaultButton.swift
//  WeatherUI
//
//  Created by Octavian Mihuț Ilie on 07/03/2021.
//

import SwiftUI

struct DefaultButton: View {
    var buttonText: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        Text(buttonText)
            .frame(width: 280, height: 50, alignment: .center)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(10)
    }
}
