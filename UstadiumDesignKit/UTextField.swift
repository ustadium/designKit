//
//  UTextField.swift
//  predictor
//
//  Created by Noah Iarrobino on 10/30/25.
//

import SwiftUI

struct UTextField: View {
    
    @Binding var text: String
    var placeholder: String = ""
    
    var body: some View {
        TextField(placeholder, text: $text)
            .padding(.leading, 6)
            .frame(maxWidth: .infinity)
            .frame(height: 50, alignment: .leading)
            .background(Color.textFieldBackground)
            .cornerRadius(12)
    }
}
