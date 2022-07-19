//
//  RoomManagerView.swift
//  dorm
//
//  Created by JongHo Park on 2022/07/19.
//

import UIKit

final class RoomManagerView: UIView {

    // MARK: - class Life cycle
    init() {
        super.init(frame: .zero)
        commomInit()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        commomInit()
    }

    required init?(coder: NSCoder) {
        fatalError("Don`t need coder initializer")
    }

    /// UI 요소를 추가하는 함수
    private func commomInit() {

    }
    
}
