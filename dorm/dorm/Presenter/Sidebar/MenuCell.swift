//
//  MenuCellTableViewCell.swift
//  dorm
//
//  Created by JongHo Park on 2022/07/20.
//

import UIKit

final class MenuCell: UITableViewCell {

    // MARK: - Properties
    static let cellId = "MenuCell"
    private let screenState: ScreenState
    private let titleLabel: UILabel = UILabel(frame: .zero)
    private let icon: UIImageView

    // MARK: - MenuCell Life cycle
    init(_ screenState: ScreenState) {
        self.screenState = screenState
        self.icon = screenState.icon
        super.init(style: .default, reuseIdentifier: MenuCell.cellId)
        backgroundColor = .clear
        selectionStyle = .none
        setUpViews()
    }

    required init?(coder: NSCoder) {
        fatalError("Don`t need to be implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            icon.tintColor = .white
            titleLabel.textColor = .white
            contentView.backgroundColor = .postechRed
        } else {
            icon.tintColor = .postechRed
            titleLabel.textColor = .black
            contentView.backgroundColor = .clear
        }
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16))
    }
}

// MARK: - set up UI Componenets
private extension MenuCell {
    func setUpViews() {
        setUpContentView()
        setUpIcon()
        setUpTitleLabel()
    }

    func setUpContentView() {
        contentView.layer.cornerRadius = 10
        contentView.layer.masksToBounds = true
    }

    func setUpTitleLabel() {
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = screenState.title
        titleLabel.font = .preferredFont(forTextStyle: .body)
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: icon.safeAreaLayoutGuide.trailingAnchor, constant: 16),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.centerYAnchor)
        ])
    }

    func setUpIcon() {
        contentView.addSubview(icon)
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.tintColor = .postechRed
        NSLayoutConstraint.activate([
            icon.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            icon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
}
// MARK: - Preview
#if DEBUG
import SwiftUI
struct MenuCellPreview: PreviewProvider {
    static var previews: some View {
        Group {
            MenuCellPreview.makeMenuCell()
                .previewInterfaceOrientation(.landscapeLeft)
            MenuCell(.roomManage).toPreview()
                .previewInterfaceOrientation(.landscapeLeft)
        }
    }

    static private func makeMenuCell() -> some View {
        let menuCell: MenuCell = MenuCell(.roomManage)
        menuCell.isSelected = true
        return menuCell.toPreview()
    }
}
#endif
