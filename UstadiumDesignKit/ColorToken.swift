//
//  ColorToken.swift
//  UstadiumDesignKit
//
//  Created by Noah Iarrobino on 1/9/26.
//

// UstadiumDesignKit/ColorToken.swift

// UstadiumDesignKit/DesignTokens.swift
import SwiftUI
import UIKit

/// Protocol that client apps must implement to provide their color values
public protocol ColorTheme {
    // Brand Colors
    var primary: Color { get }
    var destructive: Color { get }
    var textColor: Color { get }
    var textFieldBackground: Color { get }
    var containerBackground: Color { get }
    var componentBackground: Color { get }
}

/// Singleton to hold the current theme
public class DesignSystem {
    public static var shared = DesignSystem()
    
    private var _theme: ColorTheme?
    
    /// The current color theme. Must be set by the app before using any components.
    public var theme: ColorTheme {
        get {
            guard let theme = _theme else {
                fatalError("DesignSystem.shared.theme must be set before using UstadiumDesignKit components. Call DesignSystem.shared.configure(theme:) in your app's initialization.")
            }
            return theme
        }
        set {
            _theme = newValue
        }
    }
    
    /// Configure the design system with a color theme
    public func configure(theme: ColorTheme) {
        self.theme = theme
    }
    
    private init() {}
}

/// Design tokens that reference the current theme
public enum DesignTokens {
    
    // MARK: - Colors
    public enum Colors {
        public static var primary: Color { DesignSystem.shared.theme.primary }
        public static var destructive: Color { DesignSystem.shared.theme.destructive }
        public static var textColor: Color { DesignSystem.shared.theme.textColor }
        public static var textFieldBackground: Color { DesignSystem.shared.theme.textFieldBackground }
        public static var containerBackground: Color { DesignSystem.shared.theme.containerBackground }
        public static var componentBackground: Color { DesignSystem.shared.theme.componentBackground }
    }
}
