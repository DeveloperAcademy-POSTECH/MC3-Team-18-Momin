//
//  Sidebar.swift
//  dorm
//
//  Created by JongHo Park on 2022/07/20.
//

import UIKit

final class Sidebar: UIView {
    // MARK: - Properties
    lazy var tableView: UITableView = {
        let tableView: UITableView = UITableView(frame: .zero, style: .grouped)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.separatorStyle = .none
        tableView.rowHeight = 44
        return tableView
    }()
    // MARK: - class Lifecycle
    init() {
        super.init(frame: .zero)
        setUpViews()
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
private extension Sidebar {

    func setUpViews() {
        setUpTableView()
    }

    func setUpTableView() {
        addSubview(tableView)
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
            Sidebar().toPreview()
        }
    }
}
#endif
