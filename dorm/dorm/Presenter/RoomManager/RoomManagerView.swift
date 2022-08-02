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
        collectionView.contentInset = UIEdgeInsets(top: UIScreen.main.bounds.height / 6.5, left: UIScreen.main.bounds.width / 29.85, bottom: 0, right: (UIScreen.main.bounds.width / 29.85)-1)
        collectionView.isScrollEnabled = true
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .clear

        return collectionView
    }()

    // MARK: - UI Component
    lazy var segmentedControlView: UISegmentedControl = {
        let control = UISegmentedControl(items: ["1F", "2F", "3F", "4F"])
        control.selectedSegmentTintColor = .white
        control.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.black], for: UIControl.State.normal)
        control.addTarget(self, action: #selector(segconChanged(segmentedControl:)), for: UIControl.Event.valueChanged)

        return control
    }()

    var detailView: RoomDetailView! {
        didSet {
            addSubview(detailView)
            setUpViews()
        }
    }

    @objc func segconChanged(segmentedControl: UISegmentedControl) {

        switch segmentedControlView.selectedSegmentIndex {
        case 0:
                print("1f")
        case 1:
                print("2f")
        case 2:
                print("3f")
        case 3:
                print("4f")
        default: return
        }
    }

    // MARK: - class Life cycle
    init() {
        super.init(frame: .zero)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
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
        setUpSegmentedControlView()
        setUpDetailView()
    }

    func setUpCollectionView() {
        addSubview(roomCollectionView)
        roomCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            roomCollectionView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            roomCollectionView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            roomCollectionView.trailingAnchor.constraint(equalTo: detailView.leadingAnchor),
            roomCollectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }

    func setUpDetailView() {
        detailView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            detailView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            detailView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            detailView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            detailView.widthAnchor.constraint(equalToConstant: 300)
        ])
    }

    func setUpSegmentedControlView() {
        addSubview(segmentedControlView)
        segmentedControlView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            segmentedControlView.widthAnchor.constraint(equalToConstant: 330)
        ])
    }
}

// MARK: - API
extension RoomManagerView {
    func hideDetailView() {
        UIView.animate(withDuration: 0.5, delay: 0) { [weak self] in
            guard let self = self else { return }
            self.detailView.widthConstraint?.constant = 0
            self.layoutIfNeeded()
        }
    }

    func showDetailView() {
        UIView.animate(withDuration: 0.5, delay: 0) { [weak self] in
            guard let self = self else { return }
            self.detailView.widthConstraint?.constant = 300
            self.layoutIfNeeded()
        }
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
