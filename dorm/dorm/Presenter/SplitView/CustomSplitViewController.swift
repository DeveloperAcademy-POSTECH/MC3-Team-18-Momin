//
//  CustomSplitViewController.swift
//  dorm
//
//  Created by JongHo Park on 2022/07/20.
//

import Combine
import UIKit

class CustomSplitViewController: UISplitViewController {

    // MARK: - Properties
    // TODO: Side bar ViewContoller 만들고 primary 영역에 설정해야함!
    private lazy var sideBarViewController: UIViewController = RoomManagerViewController()
    private lazy var roomManagerViewController: UIViewController = RoomManagerViewController()
    private let screenState: ScreenStateManager = ScreenStateManager()
    private var cancelBag: Set<AnyCancellable> = []
    // MARK: - class Lifecycle
    override init(style: UISplitViewController.Style = .doubleColumn) {
        super.init(style: style)
        setUpViewControllers()
    }

    required init?(coder: NSCoder) {
        fatalError("Don`t need to be implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }

}

// MARK: - set up split view controllers
private extension CustomSplitViewController {

    /// Primary ViewController 와 SecondViewController 를 설정하는 함수
    func setUpViewControllers() {
        setViewController(sideBarViewController, for: .primary)
        setViewController(roomManagerViewController, for: .secondary)
    }
}

// MARK: - bind state data
private extension CustomSplitViewController {

    /// Screen State 를 bind 하는 함수
    func bindScreenState() {
        screenState.$currentScreenState
            .receive(on: DispatchQueue.main)
            .sink { [weak self] state in
                guard let self = self else { return }
                switch state {
                case .roomManage:
                    self.changeSecondaryViewController(self.roomManagerViewController)
                }
            }
            .store(in: &cancelBag)
    }
}

// MARK: - View Controller Manage
private extension CustomSplitViewController {
    func changeSecondaryViewController(_ viewController: UIViewController) {
        showDetailViewController(viewController, sender: self)
    }
}

#if DEBUG
import SwiftUI
struct CustomSplitViewControllerPreview: PreviewProvider {
    static var previews: some View {
        CustomSplitViewController().toPreview().previewInterfaceOrientation(.landscapeLeft)
    }
}
#endif
