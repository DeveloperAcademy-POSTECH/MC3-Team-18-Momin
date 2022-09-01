//
//  RoomDetailViewController.swift
//  Podorm
//
//  Created by Keum MinSeok on 2022/08/31.
//

import UIKit


class RoomDetailViewController: UIViewController, SeparatedRoomDelegate {

    private let viewModel: RoomManagerViewModel

    func editButtonPressed() {
        let notesViewController = NotesViewController()
        notesViewController.modalPresentationStyle = .pageSheet
        present(notesViewController, animated: true)
    }

    private lazy var roomDetailView: RoomDetailView = RoomDetailView(students: [
        Student(0, "Sophia", "Sophia", 103, 0),
        Student(1, "Isabella", "Isabella", 103, 1)
    ])

    init(_ viewModel: RoomManagerViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func loadView() {
        super.loadView()
        view = roomDetailView
        for subview in roomDetailView.roomDetailStackView.subviews {
            if subview is SeparatedRoomView == true {
                (subview as? SeparatedRoomView)?.delegate = self
            }
        }
    }
}
