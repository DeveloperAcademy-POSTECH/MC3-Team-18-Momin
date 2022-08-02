//
//  RoomManagerViewController.swift
//  dorm
//
//  Created by JongHo Park on 2022/07/19.
//

import Combine
import UIKit
import UniformTypeIdentifiers

/// RoomManagerViewController - Room Collection View 와 Room Detail Controller 를 관리하는 ViewController 입니다.
final class RoomManagerViewController: UIViewController {
    private var csvUrl: URL?
    private lazy var roomManagerView: RoomManagerView = RoomManagerView()
    private lazy var roomDetailViewController: RoomDetailViewController = RoomDetailViewController(viewModel)

    private var viewModel: RoomManagerViewModel = RoomManagerViewModel()

    private var cancelBag: Set<AnyCancellable> = []

    private var isShowing: Bool = true
    override func viewDidLoad() {
        super.viewDidLoad()
        roomManagerView.roomCollectionView.delegate = self
        roomManagerView.roomCollectionView.dataSource = self
        setUpNavigationTitle()
        setUpToolBarTitle()
        bindViewModel()
    }

    override func loadView() {
        super.loadView()
        view = roomManagerView
        addChild(roomDetailViewController)
        roomDetailViewController.didMove(toParent: self)
        if let detailView = roomDetailViewController.view as? RoomDetailView {
            roomManagerView.detailView = detailView
        }
    }

    private func setUpNavigationTitle() {
        navigationItem.title = "Room Manager"
        navigationItem.titleView = roomManagerView.segmentedControlView
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    private func setUpToolBarTitle() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "import", style: .plain, target: self, action: #selector(importButtonPressed(_: )))
        navigationItem.rightBarButtonItem?.tintColor = .postechRed
        navigationController?.navigationBar.tintColor = .postechRed
    }

    /// Collection View 의 Cell 을 클릭했을 때 옆에 Detail View Controller 를 띄워주는 함수
    private func showDetailViewController(_ students: [Student]) {
        roomManagerView.showDetailView()
    }

    @objc private func importButtonPressed(_ sender: Any) {
        if presentedViewController == nil {
            let csvTypes: [UTType] = [.data]
            let documentPicker = UIDocumentPickerViewController(forOpeningContentTypes: csvTypes, asCopy: true)
            documentPicker.delegate = self
            documentPicker.modalPresentationStyle = .pageSheet
            present(documentPicker, animated: true)
        }
    }

    private func hideDetailViewController() {
        roomManagerView.hideDetailView()
    }

}

extension RoomManagerViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UIDocumentPickerDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 18
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RoomCollectionViewCell.identifier, for: indexPath) as? RoomCollectionViewCell else { return UICollectionViewCell() }

        if indexPath.row < MockDatas.dormRooms.count {
            cell.configureCell(index: indexPath.row)
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width / 7, height: UIScreen.main.bounds.height / 6.3)
    }
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentAt url: URL) {
        dismiss(animated: true)
        guard url.startAccessingSecurityScopedResource() else {
            url.stopAccessingSecurityScopedResource()
            return
        }
        url.stopAccessingSecurityScopedResource()
        csvUrl = url
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.changeDormRoom(MockDatas.dormRooms[indexPath.row])
    }
}

// MARK: - RoomManagerViewModel 
private extension RoomManagerViewController {
    func bindViewModel() {
        viewModel.$currentSelectedDormRoom
            .sink { [weak self] dormRoom in
                guard let dormRoom = dormRoom, let self = self else {
                    self?.hideDetailViewController()
                    return
                }
                self.showDetailViewController([])
            }.store(in: &cancelBag)
    }
}

// MARK: - Preview
#if DEBUG
import SwiftUI
struct RoomManagerViewControllerPreview: PreviewProvider {
    static var previews: some View {
        UINavigationController(rootViewController: RoomManagerViewController())
            .toPreview()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
#endif
