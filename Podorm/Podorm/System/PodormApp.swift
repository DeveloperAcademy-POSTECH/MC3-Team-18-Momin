//
//  PodormApp.swift
//  Podorm
//
//  Created by JongHo Park on 2022/08/25.
//

import FirebaseCore
import SwiftUI

@main
struct PodormApp: App {

    @StateObject private var appState: AppState
    private let diContainer: DIContainer

    init() {
        FirebaseApp.configure()
        let add: AppState = .init()
        self._appState = StateObject(wrappedValue: add)
        self.diContainer = DIContainer(interactors: .init(
            roomListInteractor: RealRoomListInteractor(roomRepository: FirebaseRoomRepository.shared, appState: add)
        ))
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
                .inject(diContainer)
                .inject(appState)
        }
    }
}
