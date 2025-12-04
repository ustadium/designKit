//
//  TextFieldView.swift
//  Playground
//
//  Created by Noah Iarrobino on 11/28/25.
//

import SwiftUI

struct TextFieldView: View {
    @State private var textFieldInput: String = ""
    var body: some View {
        VStack {
            UTextField(text: $textFieldInput, placeholder: "Test it out")
            UText(textFieldInput)
        }
        .padding()
        .background(Color.background)
    }
}

