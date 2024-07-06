// ColorButton.swift
import SwiftUI

struct ColorButton: View {
    let title: String
    let backgroundColor: Color
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .frame(width: 120, height: 60)
                .background(backgroundColor)
                .cornerRadius(10)
        }
    }
}
