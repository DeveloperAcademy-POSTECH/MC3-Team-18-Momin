//
//  CustomSplitViewController.swift
//  dorm
//
//  Created by JongHo Park on 2022/07/20.
//

import UIKit

final class CustomSplitViewController: UISplitViewController {

    // MARK: - Properties
    private lazy var sideBarViewController: SidebarViewController = SidebarViewController(self)
    // 현재 보여지는 viewController 를 나타냄 -> 중복 교체 방지
    private var currentViewController: UIViewController?

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
    }
}

// MARK: - conform Sidebar Delegate 
extension CustomSplitViewController: SidebarDelegate {

    func showDetailViewController(_ viewController: UIViewController) {
        guard currentViewController != viewController else { return }

        currentViewController = viewController

        guard viewControllers.count == 2, let navigationController = viewControllers.last as? UINavigationController else {
            setViewController(currentViewController, for: .secondary)
            return
        }
        navigationController.viewControllers = [viewController]
    }

}

// MARK: - Preview
#if DEBUG
import SwiftUI
struct CustomSplitViewControllerPreview: PreviewProvider {
    static var previews: some View {
        CustomSplitViewController().toPreview().previewInterfaceOrientation(.landscapeLeft)
    }
}
#endif
