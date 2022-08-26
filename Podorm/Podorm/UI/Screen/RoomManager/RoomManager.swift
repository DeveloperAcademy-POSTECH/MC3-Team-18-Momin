//
//  RoomManager.swift
//  Podorm
//
//  Created by JongHo Park on 2022/08/26.
//

import SwiftUI

struct RoomManager: View {
    @EnvironmentObject private var appState: AppState
    @Environment(\.injected) private var diContainer: DIContainer

    var body: some View {
        Text("Room Manager View")
    }
}

#if DEBUG
// MARK: - Preview
struct RoomManager_Previews: PreviewProvider {
    static var previews: some View {
        RoomManager()
            .injectPreview()
    }
}
#endif
