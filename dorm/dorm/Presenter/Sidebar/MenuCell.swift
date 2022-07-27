//
//  MenuCellTableViewCell.swift
//  dorm
//
//  Created by JongHo Park on 2022/07/20.
//

import UIKit

final class MenuCell: UITableViewCell {

    // MARK: - Properties
    private let titleLabel: UILabel = UILabel(frame: .zero)
    private let icon: UIImageView = UIImageView(frame: .zero)

    // MARK: - MenuCell Life cycle

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        selectionStyle = .none
        setUpViews()
    }

    required init?(coder: NSCoder) {
        fatalError("Don`t need to be implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setSelected(selected)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16))
    }

    func configure(_ screenState: ScreenState) {
        titleLabel.text = screenState.title
        icon.image = screenState.icon
    }

}

// MARK: - set up UI Componenets
private extension MenuCell {

    func setSelected(_ selected: Bool) {
        icon.tintColor = selected ? .white : .postechRed
        titleLabel.textColor = selected ? .white : .black
        contentView.backgroundColor = selected ? .postechRed : .clear
    }

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
            MenuCell().toPreview()
                .previewInterfaceOrientation(.landscapeLeft)
        }
    }

    static private func makeMenuCell() -> some View {
        let menuCell: MenuCell = MenuCell()
        menuCell.isSelected = true
        return menuCell.toPreview()
    }
}
#endif
