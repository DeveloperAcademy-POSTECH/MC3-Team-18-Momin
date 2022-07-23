//
//  SidebarbarViewController.swift
//  dorm
//
//  Created by JongHo Park on 2022/07/20.
//

import UIKit

protocol SidebarDelegate: AnyObject {
    func showDetailViewController(_ viewController: UIViewController)
}

final class SidebarViewController: UIViewController {

    // MARK: - Properties
    private lazy var sidebar: Sidebar = Sidebar()
    weak var delegate: SidebarDelegate?
    private var isInitialzed: Bool = false

    // MARK: - ViewController Life cycle
    init(_ delegate: SidebarDelegate? = nil) {
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("Don`t need to be implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        sidebar.tableView.delegate = self
        sidebar.tableView.dataSource = self
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        navigationItem.title = "Room manage"
    }

    override func loadView() {
        view = sidebar
    }

}

// MARK: - UITableViewDelegate
extension SidebarViewController: UITableViewDelegate {

    // cell 을 클릭했을 때 실행되는 delegate method
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.showDetailViewController(ScreenState.allCases[indexPath.row].viewController)
    }

    // cell 을 처음으로 표시할 때, 첫 번째 cell을 selection 상태로 설정
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard !isInitialzed else { return }

        if indexPath.row == 0 {
            isInitialzed = true
            tableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
            tableView.delegate?.tableView?(tableView, didSelectRowAt: indexPath)
        }
    }

}

// MARK: - UITableViewDataSource
extension SidebarViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ScreenState.allCases.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MenuCell = MenuCell(ScreenState.allCases[indexPath.row])
        return cell
    }
}

// MARK: - Preview
#if DEBUG
import SwiftUI
struct SidebarViewControllerPreview: PreviewProvider {
    static var previews: some View {
        UINavigationController(rootViewController: SidebarViewController())
            .toPreview()
    }
}
#endif
