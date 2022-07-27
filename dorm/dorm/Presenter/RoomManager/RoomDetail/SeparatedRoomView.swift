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
    private var roomType: Int

    lazy var horizontalDivider: UIView = {
        let divider = UIView()
        divider.backgroundColor = .gray
        return divider
    }()

    lazy var verticalDivider: UIView = {
        let divider = UIView()
        divider.backgroundColor = .gray
        return divider
    }()

    lazy var roomNumberLabel: UILabel = {
        let roomNumber = UILabel()
        roomNumber.text = String(student.roomNumber)
        roomNumber.font = UIFont.boldSystemFont(ofSize: 28)
        return roomNumber
    }()

    lazy var studentInfo: UIStackView = {
        let studentName = UILabel()
        studentName.text = student.name
        studentName.font = UIFont.boldSystemFont(ofSize: 22)

        let studentNationality = UILabel()
        studentNationality.text = "Temp Country"
        studentNationality.font = UIFont.systemFont(ofSize: 13, weight: .semibold)
        studentNationality.textColor = .gray

        let infoStack = UIStackView(arrangedSubviews: [studentName, studentNationality])
        infoStack.axis = .vertical
        infoStack.spacing = 10
        return infoStack
    }()

    lazy var detailScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()

    lazy var editButton: UIButton = {
        let editBtn = UIButton(type: UIButton.ButtonType.system)
        editBtn.setTitle("Edit", for: UIControl.State.normal)
        editBtn.setTitleColor(UIColor.postechRed, for: .normal)
        return editBtn
    }()

    init(curStudent: Student, roomType: Int) {
        self.student = curStudent
        self.roomType = roomType
        super.init(frame: .zero)
        setUpViews()
    }

    required init?(coder: NSCoder) {
        fatalError("Don't need coder initializer")
    }

    private func setUpViews() {
        setUpRoomNumberLabel()
        setUpStudentInfo()
        setUpScrollView()
    
        if roomType%2 == 0 {
            addSubview(horizontalDivider)
            horizontalDivider.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                horizontalDivider.bottomAnchor.constraint(equalTo: self.bottomAnchor),
                horizontalDivider.leftAnchor.constraint(equalTo: self.leftAnchor),
                horizontalDivider.widthAnchor.constraint(equalTo: self.widthAnchor),
                horizontalDivider.heightAnchor.constraint(equalToConstant: 0.5)
            ])
        }
    }
}

private extension SeparatedRoomView {
    func setUpRoomNumberLabel() {
        addSubview(roomNumberLabel)
        roomNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            roomNumberLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20), roomNumberLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20)
        ])

        addSubview(editButton)
        editButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            editButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20),
            editButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 20)
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
        SeparatedRoomView(curStudent: Student(0, "Dean", "D", 102, 0), roomType: 0).toPreview().previewInterfaceOrientation(.landscapeRight)
    }
}
#endif
