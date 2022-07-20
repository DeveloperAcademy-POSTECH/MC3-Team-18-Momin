//
//  SeparatedRoomView.swift
//  dorm
//
//  Created by Minkyeong Ko on 2022/07/20.
//

import UIKit

final class SeparatedRoomView: UIView {
    enum RoomState: Int {
        case pending
        case living

        var stateIcon: String {
            switch self {
            case .pending:
                return "person"
            case .living:
                return "person.fill"
            }
        }
    }

    private var studentState = [RoomState.pending, RoomState.living]

    private var student: Student

    lazy var roomNumberLabel: UILabel = {
        let roomNumber = UILabel()
        roomNumber.text = String(student.roomNumber)
        roomNumber.font = UIFont.boldSystemFont(ofSize: 28)
        return roomNumber
    }()

    lazy var studentInfo: UIStackView = {
        let config = UIImage.SymbolConfiguration(textStyle: .headline)
        let image = UIImage(systemName: studentState[student.state].stateIcon, withConfiguration: config)
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

//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setUpViews()
//    }

    required init?(coder: NSCoder) {
        fatalError("Don't need coder initializer")
    }

    private func setUpViews() {
        self.backgroundColor = .gray

        addSubview(roomNumberLabel)
        roomNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        roomNumberLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        roomNumberLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20).isActive = true
        addSubview(studentInfo)
        studentInfo.translatesAutoresizingMaskIntoConstraints = false
        studentInfo.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        studentInfo.topAnchor.constraint(equalTo: roomNumberLabel.bottomAnchor, constant: 20).isActive = true
        addSubview(detailScrollView)
        detailScrollView.translatesAutoresizingMaskIntoConstraints = false
        detailScrollView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        detailScrollView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20).isActive = true
        detailScrollView.topAnchor.constraint(equalTo: studentInfo.bottomAnchor, constant: 20).isActive = true
        detailScrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20).isActive = true
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
