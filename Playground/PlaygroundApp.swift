//
//  PlaygroundApp.swift
//  Playground
//
//  Created by Noah Iarrobino on 11/24/25.
//

import SwiftUI
import Combine

@main
struct PlaygroundApp: App {
    
    @StateObject private var navManager = NavigationManager()

    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $navManager.path) {
                ContentView()
                    .navigationTitle("Playground App")
                    .navigationDestination(for: AppRoute.self) { route in
                        switch route {
                        case .text:
                            TextViews()
                        case .inputs:
                            TextFieldView()
                        case .alert:
                            AlertView()
                        default: EmptyView()
                    }
                        
                    
                }
            }
            .environmentObject(navManager)
        }
    }
}


class NavigationManager: ObservableObject {
    @Published var path = NavigationPath()

    func navigate(to route: AppRoute) {
        path.append(route)
    }
    
    func pop() {
        if !path.isEmpty {
            path.removeLast()
        }
    }
    
    func reset() {
        path = NavigationPath()
    }
}

enum AppRoute: Hashable, CaseIterable {
    case text
    case buttons
    case inputs
    case alert
}
