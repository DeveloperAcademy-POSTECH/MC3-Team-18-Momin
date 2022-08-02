//
//  SeparatedRoomView.swift
//  dorm
//
//  Created by Minkyeong Ko on 2022/07/20.
//

import UIKit

protocol SeparatedRoomDelegate {
    func editButtonPressed()
}

final class SeparatedRoomView: UIView {

    private var studentState = ["person", "person.fill"]
    var delegate: SeparatedRoomDelegate?

    private var student: Student
    private var roomType: Int
    
    lazy private var horizontalDivider: UIView = {
        let divider = UIView()
        divider.backgroundColor = .gray
        return divider
    }()

    lazy private var verticalDivider: UIView = {
        let divider = UIView()
        divider.backgroundColor = .gray
        return divider
    }()

    lazy private var roomNumberLabel: UILabel = {
        let roomNumber = UILabel()
        roomNumber.text = String(student.roomNumber)
        roomNumber.font = UIFont.boldSystemFont(ofSize: 28)
        roomNumber.textColor = .black
        return roomNumber
    }()

    lazy private var studentInfo: UIStackView = {
        let studentName = UILabel()
        studentName.text = student.name
        studentName.font = UIFont.boldSystemFont(ofSize: 24)
        studentName.textColor = .black

        let studentNationality = UILabel()
        studentNationality.text = "United Kingdom"
        studentNationality.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        studentNationality.textColor = .gray

        let infoStack = UIStackView(arrangedSubviews: [studentName, studentNationality])
        infoStack.axis = .vertical
        infoStack.spacing = 10
        return infoStack
    }()

    lazy private var detailTextView: UITextView = {
        let textView = UITextView()
        textView.text = "- Vegeterian"
        textView.backgroundColor = .white
        textView.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        textView.isEditable = false
        textView.textColor = .black
        return textView
    }()

    lazy private var editButton: UIButton = {
        let editBtn = UIButton(type: UIButton.ButtonType.system)
        editBtn.setTitle("Edit", for: UIControl.State.normal)
        editBtn.setTitleColor(UIColor.postechRed, for: .normal)
            editBtn.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return editBtn
    }()
    
    init(curStudent: Student, roomType: Int) {
        self.student = curStudent
        self.roomType = roomType
        super.init(frame: .zero)
        self.restorationIdentifier = "editButton"
        setUpViews()
    }

    required init?(coder: NSCoder) {
        fatalError("Don't need coder initializer")
    }
    
    @objc func buttonPressed() {
        if let delegate = delegate {
            delegate.editButtonPressed()
        }
    }

    private func setUpViews() {
        setUpRoomNumberLabel()
        setUpStudentInfo()
        setUpTextView()

        if roomType != 1 {
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
            roomNumberLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
            roomNumberLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 0)
        ])

        addSubview(editButton)
        editButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            editButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 130),
            editButton.rightAnchor.constraint(equalTo: self.rightAnchor),
            editButton.topAnchor.constraint(equalTo: self.topAnchor),
            editButton.widthAnchor.constraint(equalTo: self.widthAnchor)
        ])
    }

    func setUpStudentInfo() {
        addSubview(studentInfo)
        studentInfo.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            studentInfo.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
            studentInfo.topAnchor.constraint(equalTo: roomNumberLabel.bottomAnchor, constant: 0)
        ])
    }

    func setUpTextView() {
        addSubview(detailTextView)
        detailTextView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            detailTextView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
            detailTextView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0),
            detailTextView.topAnchor.constraint(equalTo: studentInfo.bottomAnchor, constant: 0),
            detailTextView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
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
