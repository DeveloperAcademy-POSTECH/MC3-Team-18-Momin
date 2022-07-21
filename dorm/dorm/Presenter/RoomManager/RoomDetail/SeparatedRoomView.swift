//
//  SeparatedRoomView.swift
//  dorm
//
//  Created by Minkyeong Ko on 2022/07/20.
//

import UIKit

final class SeparatedRoomView: UIView {

    private var studentState = ["person", "person.fill"]

    private var student: Student

    lazy var roomNumberLabel: UILabel = {
        let roomNumber = UILabel()
        roomNumber.text = String(student.roomNumber)
        roomNumber.font = UIFont.boldSystemFont(ofSize: 28)
        return roomNumber
    }()

    lazy var studentInfo: UIStackView = {
        let config = UIImage.SymbolConfiguration(textStyle: .headline)
        let image = UIImage(systemName: studentState[student.state], withConfiguration: config)
        let iconImage = UIImageView(image: image)
        iconImage.tintColor = .black
        iconImage.contentMode = .scaleAspectFit
        let studentName = UILabel()
        studentName.text = student.name
        studentName.font = UIFont.systemFont(ofSize: 22)
        let infoStack = UIStackView(arrangedSubviews: [iconImage, studentName])
        infoStack.axis = .horizontal
        infoStack.spacing = 10
        return infoStack
    }()

    lazy var detailScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .yellow
        return scrollView
    }()

    init(curStudent: Student) {
        self.student = curStudent
        super.init(frame: .zero)
        setUpViews()
    }

    required init?(coder: NSCoder) {
        fatalError("Don't need coder initializer")
    }

    private func setUpViews() {
        self.backgroundColor = .gray
        setUpRoomNumberLabel()
        setUpStudentInfo()
        setUpScrollView()
    }
}

private extension SeparatedRoomView {
    func setUpRoomNumberLabel() {
        addSubview(roomNumberLabel)
        roomNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            roomNumberLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20), roomNumberLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20)
        ])
    }

    func setUpStudentInfo() {
        addSubview(studentInfo)
        studentInfo.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            studentInfo.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            studentInfo.topAnchor.constraint(equalTo: roomNumberLabel.bottomAnchor, constant: 20)
        ])
    }

    func setUpScrollView() {
        addSubview(detailScrollView)
        detailScrollView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            detailScrollView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            detailScrollView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            detailScrollView.topAnchor.constraint(equalTo: studentInfo.bottomAnchor, constant: 20),
            detailScrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20)
        ])
    }
}

#if DEBUG
import SwiftUI
struct SeparatedRoomPreview: PreviewProvider {
    static var previews: some View {
        SeparatedRoomView(curStudent: Student(0, "Dean", "D", 102, 0)).toPreview().previewInterfaceOrientation(.landscapeRight)
    }
}
#endif
