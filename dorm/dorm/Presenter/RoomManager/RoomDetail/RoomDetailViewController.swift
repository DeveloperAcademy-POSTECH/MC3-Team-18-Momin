//
//  RoomDetailViewController.swift
//  dorm
//
//  Created by Minkyeong Ko on 2022/07/19.
//

import UIKit

class RoomDetailViewController: UIViewController {
    private lazy var roomDetailView: RoomDetailView = RoomDetailView()

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func loadView() {
        super.loadView()
        view = roomDetailView
    }
}
