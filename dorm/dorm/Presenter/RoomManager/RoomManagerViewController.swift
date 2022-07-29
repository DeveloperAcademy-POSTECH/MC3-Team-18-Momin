//
//  RoomManagerViewController.swift
//  dorm
//
//  Created by JongHo Park on 2022/07/19.
//

import UIKit

/// RoomManagerViewController - Room Collection View 와 Room Detail Controller 를 관리하는 ViewController 입니다.
final class RoomManagerViewController: UIViewController {

    private lazy var roomManagerView: RoomManagerView = RoomManagerView()

    override func viewDidLoad() {
        super.viewDidLoad()
        roomManagerView.roomCollectionView.delegate = self
        roomManagerView.roomCollectionView.dataSource = self
        setUpNavigationTitle()
        setUpToolBarTitle()
    }

//    private var roomCollectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        layout.minimumLineSpacing = 60
//
//        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        collectionView.register(RoomCollectionViewCell.self, forCellWithReuseIdentifier: "RoomCollectionViewCell")
//        collectionView.contentInset = UIEdgeInsets(top: UIScreen.main.bounds.height / 4.91, left: UIScreen.main.bounds.width / 29.85, bottom: 0, right: (UIScreen.main.bounds.width / 29.85)-1)
//        collectionView.translatesAutoresizingMaskIntoConstraints = false
//        collectionView.isScrollEnabled = false
//        collectionView.backgroundColor = .clear
//
//        return collectionView
//    }()

    override func loadView() {
        super.loadView()
        view = roomManagerView
    }

    private func setUpNavigationTitle() {
        navigationItem.title = "Room Manager"
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    private func setUpToolBarTitle() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "import", style: .plain, target: nil, action: nil)
    }

}

#if DEBUG
import SwiftUI
struct RoomManagerViewControllerPreview: PreviewProvider {
    static var previews: some View {
        NavigationView {
            List {
                Text("Room Manager")
            }
            UINavigationController(rootViewController: RoomManagerViewController())
            .toPreview()
        }
        .previewInterfaceOrientation(.landscapeLeft)
    }
}
#endif

extension RoomManagerViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 18
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RoomCollectionViewCell.identifier, for: indexPath) as? RoomCollectionViewCell else { return UICollectionViewCell() }

        if indexPath.row < MockDatas.students.count {
            cell.configureRoomStudents(students: MockDatas.students[indexPath.row])
        }

        if indexPath.row < MockDatas.dormRooms.count {
            cell.configureDormRoomNumber(dormRooms: MockDatas.dormRooms[indexPath.row])
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width / 6.98, height: UIScreen.main.bounds.height / 6.27)
    }
}
