//
//  ContentView.swift
//  Playground
//
//  Created by Noah Iarrobino on 11/24/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var navManager: NavigationManager
    
    var body: some View {
        List {
            Button("Go to Text View") {
                navManager.navigate(to: .text)
            }
            
            Button("Go to Text input") {
                navManager.navigate(to: .inputs)
            }
            
            Button("Go to Alert") {
                navManager.navigate(to: .alert)
            }
        }
    }
}

#Preview {
    ContentView()
}
