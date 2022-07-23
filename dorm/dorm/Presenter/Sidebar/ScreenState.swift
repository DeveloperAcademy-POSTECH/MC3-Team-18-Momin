//
//  ScreenState.swift
//  dorm
//
//  Created by JongHo Park on 2022/07/20.
//

import Combine
import UIKit

/// 화면의 탭 목록을 나타내는 enumeration
enum ScreenState: CaseIterable {
    case roomManage
    case test
}

extension ScreenState {

    var title: String {
        switch self {
        case .roomManage:
            return "방 관리"
        case .test:
            return "테스트"
        }
    }

    var icon: UIImageView {
        switch self {
        case .roomManage:
            return UIImageView(image: UIImage(systemName: "square.grid.3x3.fill")!)
        case .test:
            return UIImageView(image: UIImage(systemName: "square.grid.3x3.fill")!)
        }
    }

    var viewController: UIViewController {
        switch self {
        case .roomManage:
            return RoomManagerViewController()
        case .test:
            return SidebarViewController()
        }
    }
}
