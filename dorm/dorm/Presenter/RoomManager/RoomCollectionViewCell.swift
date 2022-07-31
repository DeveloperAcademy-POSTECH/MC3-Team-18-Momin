//
//  RoomCollectionViewCell.swift
//  dorm
//
//  Created by Keum MinSeok on 2022/07/28.
//

import UIKit

final class RoomCollectionViewCell: UICollectionViewCell {

    static let identifier = "RoomCollectionViewCell"

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(roomNumberLabel)
        contentView.addSubview(roundedRectangleView)
        contentView.addSubview(middleLineView)
        contentView.addSubview(leftPersonImageView)
        contentView.addSubview(rightPersonImageView)
        contentView.addSubview(leftPersonNameLabel)
        contentView.addSubview(rightPersonNameLabel)

        NSLayoutConstraint.activate([
            roundedRectangleView.topAnchor.constraint(equalTo: topAnchor, constant: 29),
            roundedRectangleView.bottomAnchor.constraint(equalTo: bottomAnchor),
            roundedRectangleView.leadingAnchor.constraint(equalTo: leadingAnchor),
            roundedRectangleView.trailingAnchor.constraint(equalTo: trailingAnchor),

            middleLineView.topAnchor.constraint(equalTo: roundedRectangleView.topAnchor),
            middleLineView.bottomAnchor.constraint(equalTo: roundedRectangleView.bottomAnchor),
            middleLineView.centerXAnchor.constraint(equalTo: roundedRectangleView.centerXAnchor),
            middleLineView.widthAnchor.constraint(equalToConstant: 1),

            leftPersonImageView.centerXAnchor.constraint(equalTo: roundedRectangleView.leadingAnchor, constant: bounds.width / 4),
            leftPersonImageView.topAnchor.constraint(equalTo: roundedRectangleView.topAnchor, constant: 34),
            leftPersonImageView.bottomAnchor.constraint(equalTo: roundedRectangleView.bottomAnchor, constant: -48),

            rightPersonImageView.centerXAnchor.constraint(equalTo: roundedRectangleView.trailingAnchor, constant: -(bounds.width / 4)),
            rightPersonImageView.topAnchor.constraint(equalTo: roundedRectangleView.topAnchor, constant: 34),
            rightPersonImageView.bottomAnchor.constraint(equalTo: roundedRectangleView.bottomAnchor, constant: -48),

            leftPersonNameLabel.centerXAnchor.constraint(equalTo: roundedRectangleView.leadingAnchor, constant: bounds.width / 4),
            leftPersonNameLabel.bottomAnchor.constraint(equalTo: roundedRectangleView.bottomAnchor, constant: -9),

            rightPersonNameLabel.centerXAnchor.constraint(equalTo: roundedRectangleView.trailingAnchor, constant: -(bounds.width / 4)),
            rightPersonNameLabel.bottomAnchor.constraint(equalTo: roundedRectangleView.bottomAnchor, constant: -9)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private let roomNumberLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: UIFont.systemFontSize, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let roundedRectangleView: UIView = {
        let roundRectView = UIView()
        roundRectView.backgroundColor = .white
        roundRectView.layer.cornerRadius = 8
        roundRectView.layer.borderColor = UIColor.postechRed?.cgColor
        roundRectView.layer.borderWidth = 1
        roundRectView.layer.masksToBounds = true
        roundRectView.translatesAutoresizingMaskIntoConstraints = false
        return roundRectView
    }()

    private let middleLineView: UIView = {
        let lineView = UIImageView(frame: .zero)
        lineView.backgroundColor = .postechRed
        lineView.translatesAutoresizingMaskIntoConstraints = false
        return lineView
    }()

    private let leftPersonImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .postechRed
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let rightPersonImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .postechRed
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let leftPersonNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .postechRed
        label.font = UIFont.systemFont(ofSize: 17, weight: .light)
        label.frame.size = label.intrinsicContentSize
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let rightPersonNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .postechRed
        label.font = UIFont.systemFont(ofSize: 17, weight: .light)
        label.frame.size = label.intrinsicContentSize
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    func configureRoomStudents(students: [Student]) {
        leftPersonNameLabel.text = students[0].name
        rightPersonNameLabel.text = students[1].name

        let sizeConfig = UIImage.SymbolConfiguration(pointSize: 25)
        let weightConfig = UIImage.SymbolConfiguration(weight: .light)
        let combined = sizeConfig.applying(weightConfig)
        leftPersonImageView.image = UIImage(systemName: "person", withConfiguration: combined)
        rightPersonImageView.image = UIImage(systemName: "person", withConfiguration: combined)
    }

    func configureDormRoomNumber(dormRooms: [DormRoom]) {
        roomNumberLabel.text = String(dormRooms[0].roomNumber)
    }
}
