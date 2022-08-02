//
//  NotesView.swift
//  dorm
//
//  Created by 한택환 on 2022/07/29.
//

import UIKit

final class NotesView: UIView {
    private var studentName: String = "James"
    
    private lazy var notesField: UITextView = UITextView(frame: .zero)
    private lazy var nameField: UITextField = UITextField()
    //FIXME: 임시 이름 지정 변경 필요
    private lazy var saveButton: UIButton = UIButton()
    private lazy var backButton: UIButton = UIButton()
    private lazy var roomNumber: UILabel = UILabel()
    private lazy var background: UIView = UIView()
    
    init() {
        super.init(frame: .zero)
        setUpViews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Don`t need coder initializer")
    }
}

private extension NotesView {
    func setUpViews() {
        setUpBackground()
        setUpTitle()
        setUpNameField()
        setUpNotesView()
    }
    
    func setUpBackground() {
        addSubview(background)
        background.backgroundColor = .systemGray
        background.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            background.topAnchor.constraint(equalTo: self.topAnchor),
            background.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            background.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            background.heightAnchor.constraint(equalToConstant: 54)
        ])
    }
    
    func setUpTitle() {
        addSubview(backButton)
        addSubview(saveButton)
        addSubview(roomNumber)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        roomNumber.translatesAutoresizingMaskIntoConstraints = false
        backButton.setTitle("Room manager", for: .normal)
        backButton.setTitleColor(.postechRed, for: .normal)
        saveButton.setTitle("Save", for: .normal)
        saveButton.setTitleColor(.postechRed, for: .normal)
        roomNumber.text = "101A"
        NSLayoutConstraint.activate([
            backButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 13),
            backButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 13),
            saveButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -13),
            saveButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 13),
            roomNumber.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            roomNumber.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }
    
    func setUpNameField() {
        addSubview(nameField)
        nameField.translatesAutoresizingMaskIntoConstraints = false
        nameField.text = studentName
        nameField.font = UIFont.preferredFont(forTextStyle: .body)
        NSLayoutConstraint.activate([
            nameField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 30),
            nameField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 30),
            nameField.topAnchor.constraint(equalTo: saveButton.bottomAnchor, constant: 30)
        ])
    }

    
    func setUpNotesView() {
        addSubview(notesField)
        notesField.translatesAutoresizingMaskIntoConstraints = false
        notesField.becomeFirstResponder()
        
        notesField.contentInset = .init(top: 0, left: 0, bottom: 0, right: 30)
        notesField.scrollIndicatorInsets = .init(top: 10, left: 10, bottom: 10, right: 20)
        notesField.font = UIFont.preferredFont(forTextStyle: .body)
        NSLayoutConstraint.activate([
            notesField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 30),
            notesField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            notesField.topAnchor.constraint(equalTo: nameField.bottomAnchor, constant: 30),
            notesField.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

#if DEBUG
import SwiftUI
struct NotesViewPreview: PreviewProvider {
    static var previews: some View {
            NotesView().toPreview()
        .previewInterfaceOrientation(.landscapeLeft)
    }
}
#endif
