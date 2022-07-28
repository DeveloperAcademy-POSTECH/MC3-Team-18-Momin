//
//  RoomDetailView.swift
//  dorm
//
//  Created by Minkyeong Ko on 2022/07/20.
//

import UIKit

final class RoomDetailView: UIView {

    private let students: [Student]

    lazy var roomDetailStackView: UIStackView = {
        let rooms = students.enumerated().map { (idx, student) -> UIView in
            SeparatedRoomView(curStudent: student, roomType: idx)
        }
        let stackView = UIStackView(arrangedSubviews: rooms)
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        return stackView
    }()

    init(students: [Student]) {
        self.students = students
        super.init(frame: .zero)
        setUpViews()
    }

    required init?(coder: NSCoder) {
        fatalError("Don't need coder initializer")
    }

    private func setUpViews() {
        self.backgroundColor = .systemBackground

        // 스택 뷰
        addSubview(roomDetailStackView)
        roomDetailStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            roomDetailStackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            roomDetailStackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            roomDetailStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            roomDetailStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        ])
    }
}

#if DEBUG
import SwiftUI
struct PreviewName: PreviewProvider {
    static var previews: some View {
        RoomDetailView(students: [
            Student(0, "Ryan Kim", "Ryan", 201, 0),
            Student(1, "Hi Lee", "Hi", 201, 1)
        ]).toPreview().previewInterfaceOrientation(.landscapeLeft)
    }
}
#endif
