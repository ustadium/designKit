//
//  UText.swift
//  predictor
//
//  Created by Noah Iarrobino on 10/30/25.
//

import SwiftUI

enum UTextType {
    case body
    case title
    case componentTitle
    case pageTitle
    case button
    
    var size: CGFloat {
        switch self {
        case .body:
            return 16
        case .title, .componentTitle, .button:
            return 20
        case .pageTitle:
            return 24
        }
    }
    
    var weight: Font.Weight {
        switch self {
        case .body:
            return .regular
        case .title, .componentTitle, .pageTitle, .button:
            return .medium
        }
    }
}

struct UText: View {
    let text: String
    var size: CGFloat = 16
    var weight: Font.Weight = .regular
    var color: Color = .primary
    var allowsMarkdown: Bool = true
    
    // Map SwiftUI Font.Weight to HelveticaNeue names
    private var fontName: String {
        switch weight {
        case .ultraLight, .thin: return "HelveticaNeue-Thin"
        case .light: return "HelveticaNeue-Light"
        case .regular: return "HelveticaNeue"
        case .medium, .semibold: return "HelveticaNeue-Medium"
        case .bold, .heavy, .black: return "HelveticaNeue-Bold"
        default: return "HelveticaNeue"
        }
    }

    init(_ text: String,
         size: CGFloat = 16,
         weight: Font.Weight = .regular, color: Color = .primary, allowsMarkdown: Bool = true) {
        self.text = text
        self.size = size
        self.weight = weight
        self.color = color
        self.allowsMarkdown = allowsMarkdown
    }
    
    init(_ text: String) {
        self.text = text
    }

    var body: some View {
        Group {
            if allowsMarkdown {
                Text(.init(text))
            } else {
                Text(text)
            }
        }
        .font(.custom(fontName, size: size))
        .foregroundColor(color)
    }
}

extension UText {
    func fontSize(_ newSize: CGFloat) -> UText {
        UText(text, size: newSize, weight: weight, color: color, allowsMarkdown: allowsMarkdown)
    }

    func fontWeight(_ newWeight: Font.Weight) -> UText {
        UText(text, size: size, weight: newWeight, color: color, allowsMarkdown: allowsMarkdown)
    }

    func textColor(_ newColor: Color) -> UText {
        UText(text, size: size, weight: weight, color: newColor, allowsMarkdown: allowsMarkdown)
    }

    func markdownEnabled(_ enabled: Bool) -> UText {
        UText(text, size: size, weight: weight, color: color, allowsMarkdown: enabled)
    }
    
    func textType(_ type: UTextType) -> UText {
        UText(text, size: type.size, weight: type.weight)
    }
}
