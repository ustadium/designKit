//
//  UTextField.swift
//  predictor
//
//  Created by Noah Iarrobino on 10/30/25.
//

import SwiftUI

public struct UTextField: View {
    
    @Binding var text: String
    var placeholder: String = ""
    
    public init(text: Binding<String>, placeholder: String = "") {
        self._text = text
        self.placeholder = placeholder
    }
    
    public var body: some View {
        TextField(placeholder, text: $text)
            .padding(.leading, 6)
            .frame(maxWidth: .infinity)
            .frame(height: 50, alignment: .leading)
            .background(DesignTokens.Colors.textFieldBackground)
            .cornerRadius(12)
    }
}
