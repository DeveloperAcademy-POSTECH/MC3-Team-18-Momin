//
//  PodormApp.swift
//  Podorm
//
//  Created by JongHo Park on 2022/08/25.
//

import SwiftUI

@main
struct PodormApp: App {

    @StateObject private var appState: AppState = AppState()
    private let diContainer: DIContainer

    init() {
        self.diContainer = DIContainer(interactors: .init())
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .inject(diContainer)
                .inject(appState)
        }
    }
}
