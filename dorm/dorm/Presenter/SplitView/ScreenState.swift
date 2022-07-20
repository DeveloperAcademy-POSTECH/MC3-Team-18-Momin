//
//  ScreenState.swift
//  dorm
//
//  Created by JongHo Park on 2022/07/20.
//

import Combine

/// 화면의 탭 목록을 나타내는 enumeration
enum ScreenState {
    case roomManage
}

/// 화면의 탭 상태를 관리하는 StateManager
final class ScreenStateManager {
    @Published private (set) var currentScreenState: ScreenState = .roomManage

    func changeScreen(_ screenState: ScreenState) {
        self.currentScreenState = screenState
    }
}
