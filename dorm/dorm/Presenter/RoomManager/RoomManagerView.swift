//
//  RoomManagerView.swift
//  dorm
//
//  Created by JongHo Park on 2022/07/19.
//

import UIKit

final class RoomManagerView: UIView {

    // MARK: - UI Component
    lazy var roomCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 60

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(RoomCollectionViewCell.self, forCellWithReuseIdentifier: "RoomCollectionViewCell")
        collectionView.contentInset = UIEdgeInsets(top: UIScreen.main.bounds.height / 4.91, left: UIScreen.main.bounds.width / 29.85, bottom: 0, right: (UIScreen.main.bounds.width / 29.85)-1)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isScrollEnabled = false
        collectionView.backgroundColor = .clear

        return collectionView
    }()

    // MARK: - class Life cycle
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
// MARK: - set up ui components
private extension RoomManagerView {
    /// UI 요소를 추가하는 함수
    func setUpViews() {
        // TODO: navigation Title 과 toolbar button 추가해야함
        // TODO: Floor Segmented Control 추가해야함
        setUpCollectionView()
    }

    func setUpCollectionView() {
        addSubview(roomCollectionView)
        roomCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            roomCollectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            roomCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            roomCollectionView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            roomCollectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

#if DEBUG
import SwiftUI
struct RoomManagerViewPreview: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Text("Hello")
            RoomManagerView().toPreview()
        }
        .previewInterfaceOrientation(.landscapeLeft)
    }
}
#endif
