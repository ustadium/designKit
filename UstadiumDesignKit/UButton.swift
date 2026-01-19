//
//  UButton.swift
//  predictor
//
//  Created by Noah Iarrobino on 10/30/25.
//

import SwiftUI

public enum UButtonType {
    case regular
    case inverted
}

public struct UButton: View {
    var title: String
    var action: () -> Void
    var background: Color = Color.blue
    var cornerRadius: CGFloat = 14
    var type: UButtonType = .regular
    
    public init(
        title: String,
        action: @escaping () -> Void,
        background: Color = DesignTokens.Colors.primary,
        cornerRadius: CGFloat = 14,
        type: UButtonType = .regular
    ) {
        self.title = title
        self.action = action
        self.background = background
        self.cornerRadius = cornerRadius
        self.type = type
    }
    
    var backgroundColor: Color {
        switch type {
        case .regular: return background
        case .inverted: return .clear
        }
    }
    
    var textColor: Color {
        switch type {
        case .regular: return DesignTokens.Colors.textColor
        case .inverted: return background
        }
    }
    
    public var body: some View {
        Button(action: action) {
            Text(.init(title))
                .font(.custom("HelveticaNeueMedium", size: 20))
                .foregroundStyle(textColor)
                .frame(height: 50)
                .frame(maxWidth: .infinity)
        }
        .frame(height: 50)
        .background(backgroundColor)
        .cornerRadius(cornerRadius)
        .overlay(
            RoundedRectangle(cornerRadius: cornerRadius)
                .stroke(background, lineWidth: 1)
        )
    }
}

extension UButton {
    public func background(color: Color) -> UButton {
        UButton(title: title, action: action, background: color)
    }
    
    public func buttonType(_ type: UButtonType) -> UButton {
        UButton(
            title: title,
            action: action,
            background: background,
            cornerRadius: cornerRadius,
            type: type
        )
    }
}
