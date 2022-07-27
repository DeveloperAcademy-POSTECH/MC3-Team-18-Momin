//
//  RoomManagerViewController.swift
//  dorm
//
//  Created by JongHo Park on 2022/07/19.
//

import UIKit

/// RoomManagerViewController - Room Collection View 와 Room Detail Controller 를 관리하는 ViewController 입니다.
final class RoomManagerViewController: UIViewController {

    private lazy var roomManagerView: RoomManagerView = RoomManagerView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpNavigationTitle()
        setUpToolBarTitle()
    }

    override func loadView() {
        super.loadView()
        view = roomManagerView
    }

    private func setUpNavigationTitle() {
        navigationItem.title = "Room Manager"
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    private func setUpToolBarTitle() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "import", style: .plain, target: nil, action: nil)
    }

}

#if DEBUG
import SwiftUI
struct RoomManagerViewControllerPreview: PreviewProvider {
    static var previews: some View {
        NavigationView {
            List {
                Text("Room Manager")
            }
            UINavigationController(rootViewController: RoomManagerViewController())
            .toPreview()
        }
        .previewInterfaceOrientation(.landscapeLeft)
    }
}
#endif
