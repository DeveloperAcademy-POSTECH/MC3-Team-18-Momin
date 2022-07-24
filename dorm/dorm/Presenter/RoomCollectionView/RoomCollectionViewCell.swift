//
//  RoomCollectionViewCell.swift
//  dorm
//
//  Created by Keum MinSeok on 2022/07/20.
//

import UIKit

class RoomCollectionViewCell: UICollectionViewCell {

    static let identifier = "RoomCollectionViewCell"

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white
        contentView.addSubview(roomNumberLabel)
        contentView.addSubview(roundedRectangleImageView)
        contentView.addSubview(leftPersonImageView)
        contentView.addSubview(rightPersonImageView)
        contentView.addSubview(leftPersonNameLabel)
        contentView.addSubview(rightPersonNameLabel)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private let roomNumberLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .black
        label.font = label.font.withSize(20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let roundedRectangleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 100, y: 20, width: 60, height: 40)
        imageView.layer.cornerRadius = 30
        imageView.layer.masksToBounds = true
        imageView.layer.borderColor = CGColor(red: 200, green: 1, blue: 80, alpha: 1)
        imageView.layer.borderWidth = 3
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let leftPersonImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .postechRed
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let rightPersonImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .postechRed
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let leftPersonNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .postechRed
        label.font = label.font.withSize(16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let rightPersonNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .postechRed
        label.font = label.font.withSize(16)
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
