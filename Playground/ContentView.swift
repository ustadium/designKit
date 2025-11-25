//
//  ContentView.swift
//  Playground
//
//  Created by Noah Iarrobino on 11/24/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            UText("Custom Text")
                .fontSize(24)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
