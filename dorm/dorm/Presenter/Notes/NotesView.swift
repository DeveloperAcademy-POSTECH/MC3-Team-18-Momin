//
//  NotesView.swift
//  dorm
//
//  Created by 한택환 on 2022/07/29.
//

import UIKit

final class NotesView: UIView {
    
    lazy var notesField: UITextView = UITextView(frame: .zero)
    
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
        setUpNotesView()
    }
    
    func setUpNotesView() {
        addSubview(notesField)
        notesField.translatesAutoresizingMaskIntoConstraints = false
        //FIXME: TextInputField 영역 확인 위한 임시 색상 부여 삭제 예정
        notesField.textInputView.backgroundColor = .systemOrange
        //FIXME: TextInputField, 인디케이터 임시 여백, 하이파이 비교 후 수정 예정
        notesField.contentInset = .init(top: 40, left: 30, bottom: 20, right: 30)
        notesField.scrollIndicatorInsets = .init(top: 10, left: 10, bottom: 10, right: 20)
        NSLayoutConstraint.activate([
            notesField.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            notesField.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            notesField.topAnchor.constraint(equalTo: topAnchor),
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
