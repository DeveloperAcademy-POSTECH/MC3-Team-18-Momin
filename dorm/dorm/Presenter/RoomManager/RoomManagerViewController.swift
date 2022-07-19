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
    }

    override func loadView() {
        view = roomManagerView
    }
}
