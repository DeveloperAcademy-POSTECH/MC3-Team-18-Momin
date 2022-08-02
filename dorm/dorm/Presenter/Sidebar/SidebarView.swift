//
//  Sidebar.swift
//  dorm
//
//  Created by JongHo Park on 2022/07/20.
//

import UIKit

final class SidebarView: UIView {
    // MARK: - Properties
    lazy var tableView: UITableView = UITableView(frame: .zero, style: .grouped)

    // MARK: - class Lifecycle
    convenience init() {
        self.init(frame: .zero)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }

    required init?(coder: NSCoder) {
        fatalError("Don`t need to be implemented")
    }
}

// MARK: - set up UI Components
private extension SidebarView {

    func setUpViews() {
        setUpTableView()
    }

    func setUpTableView() {
        addSubview(tableView)
        tableView.register(MenuCell.self, forCellReuseIdentifier: MenuCell.className)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white
        tableView.rowHeight = 44
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

// MARK: - Preview
#if DEBUG
import SwiftUI
struct SidebarPreview: PreviewProvider {
    static var previews: some View {
        NavigationView {
            SidebarView().toPreview()
        }
    }
}
#endif
