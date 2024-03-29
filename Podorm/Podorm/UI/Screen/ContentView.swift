//
//  ContentView.swift
//  Podorm
//
//  Created by JongHo Park on 2022/08/25.
//

import SwiftUI

struct ContentView: View {

    @Environment(\.injected) private var injected: DIContainer
    @EnvironmentObject private var appState: AppState

    private let isRunningTests: Bool

    init(isRunningTests: Bool = ProcessInfo.processInfo.isRunningTests) {
        self.isRunningTests = isRunningTests
        let coloredAppearance = UINavigationBarAppearance()
          coloredAppearance.configureWithOpaqueBackground()
        coloredAppearance.backgroundColor = UIColor.systemGray6
          coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
          UINavigationBar.appearance().standardAppearance = coloredAppearance
          UINavigationBar.appearance().compactAppearance = coloredAppearance
          UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
    }

    var body: some View {
        if isRunningTests {
            Text("Running unit tests")
        } else {
            NavigationView {
                EmptyView()
                RoomManager()
            }
        }
    }
}

#if DEBUG
// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .injectPreview()
    }
}
#endif
