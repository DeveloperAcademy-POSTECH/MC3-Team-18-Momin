//
//  RoomDetailViewController.swift
//  dorm
//
//  Created by Minkyeong Ko on 2022/07/19.
//

import UIKit

class RoomDetailViewController: UIViewController {
    private lazy var roomDetailView: RoomDetailView = RoomDetailView(students: [
        Student(0, "Ryan Kim", "Ryan", 201, 0),
        Student(1, "Hi Lee", "Hi", 201, 1)
    ])

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func loadView() {
        super.loadView()
        view = roomDetailView
    }
}
