//
//  RoomDetailView.swift
//  dorm
//
//  Created by Minkyeong Ko on 2022/07/20.
//

import UIKit

final class RoomDetailView: UIView {

    private let students: [Student] = [
        Student(0, "Ryan Kim", "Ryan", 201, 0),
        Student(1, "Hi Lee", "Hi", 201, 1)
    ]

    lazy var roomDetailStackView: UIStackView = {
        let rooms = students.map { student in
                SeparatedRoomView(curStudent: student)
        }
        let stackView = UIStackView(arrangedSubviews: rooms)
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        return stackView
    }()

    lazy var expandButton: UIButton = {
        let expandButton = UIButton(type: UIButton.ButtonType.system)
        expandButton.setTitle("Expand", for: UIControl.State.normal)
        return expandButton
    }()

    init() {
        super.init(frame: .zero)
        setUpViews()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }

    required init?(coder: NSCoder) {
        fatalError("Don't need coder initializer")
    }

    private func setUpViews() {
        self.backgroundColor = .systemBackground

        // 화면 확장 버튼
        addSubview(expandButton)
        expandButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            expandButton.topAnchor.constraint(equalTo: self.topAnchor),
            expandButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30)
        ])

        // 스택 뷰
        addSubview(roomDetailStackView)
        roomDetailStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            roomDetailStackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10),
            roomDetailStackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            roomDetailStackView.topAnchor.constraint(equalTo: expandButton.bottomAnchor, constant: 10),
            roomDetailStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
        ])
    }
}

#if DEBUG
import SwiftUI
struct PreviewName: PreviewProvider {
    static var previews: some View {
        RoomDetailView().toPreview().previewInterfaceOrientation(.landscapeLeft)
    }
}
#endif
