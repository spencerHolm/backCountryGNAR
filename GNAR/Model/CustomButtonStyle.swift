//
//  CustomButtonStyle.swift
//  GNAR
//
//  Created by Spencer Holm on 3/18/21.
//

import Foundation
import SwiftUI

struct CustomButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        return configuration.label
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .scaleEffect(configuration.isPressed ? 0.8 : 1)
            .animation(.easeInOut(duration: 0.1))
            .cornerRadius(40)
            .font(.title)
        
    }
}


struct RemoveButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        return configuration.label
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .foregroundColor(.red)
            .overlay(
                RoundedRectangle(cornerRadius: 40)
                    .stroke(Color.red, lineWidth: 5)
            )
            .scaleEffect(configuration.isPressed ? 0.8 : 1)
            .animation(.easeInOut(duration: 0.1))
            .font(.title)
        
    }
}
