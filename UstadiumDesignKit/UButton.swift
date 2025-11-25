//
//  UButton.swift
//  predictor
//
//  Created by Noah Iarrobino on 10/30/25.
//

import SwiftUI

enum UButtonType {
    case regular
    case inverted
}

struct UButton: View {
    var title: String
    var action: () -> Void
    var background: Color = Color.blue
    var cornerRadius: CGFloat = 14
    var type: UButtonType = .regular
    
    var backgroundColor: Color {
        switch type {
        case .regular: return background
        case .inverted: return .clear
        }
    }
    
    var textColor: Color {
        switch type {
        case .regular: return .white
        case .inverted: return background
        }
    }
    
    var body: some View {
        Button(action: action) {
            Text(.init(title))
                .font(.custom("HelveticaNeueMedium", size: 20))
                .foregroundStyle(textColor)
                .frame(height: 44)
                .frame(maxWidth: .infinity)
        }
        .background(backgroundColor)
        .cornerRadius(cornerRadius)
        .overlay(
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(background, lineWidth: 1)
        )
    }
}

extension UButton {
    func background(color: Color) -> UButton {
        UButton(title: title, action: action, background: color)
    }
    
    func buttonType(_ type: UButtonType) -> UButton {
        UButton(
            title: title,
            action: action,
            background: background,
            cornerRadius: cornerRadius,
            type: type
        )
    }
}
