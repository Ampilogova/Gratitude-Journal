//
//  GratitudeCell.swift
//  Gratitude Journal
//
//  Created by Tatiana Ampilogova on 1/14/22.
//

import UIKit

class GratitudeCell: UITableViewCell {
    
    let date: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 28, weight: .semibold)
        label.textColor = .customLabelColor
        label.textAlignment = .left
        label.numberOfLines = 2
        return label
    }()
    
    private var customView: UIView = {
        var view = UIView()
        view.backgroundColor = .customCellBackgroundColor
        view.makeCellRounded()
        return view
    }()
    
    private let gratitudeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textColor = .customblackColor
        label.text = loc("daily.thought")
        label.textAlignment = .left
        label.numberOfLines = 2
        return label
    }()
    
    private let textGratitudeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.textColor = .customblackColor
        label.textAlignment = .left
        label.numberOfLines = 3
        return label
    }()
    
    private let blotImage:  UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: "blot")?.withRenderingMode(.alwaysTemplate)
        image.tintColor = .customPurpleColor
        return image
    }()
    
    private let blotImage1:  UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: "blot1")?.withRenderingMode(.alwaysTemplate)
        image.tintColor = .customBlueColor
        return image
    }()
    
    private let blotImage2:  UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: "blot2")?.withRenderingMode(.alwaysTemplate)
        image.tintColor = .customYellowColor
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .customBackgroundColor
        customView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(customView)
        NSLayoutConstraint.activate([
            customView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            customView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            customView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            customView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
        ])

        blotImage.translatesAutoresizingMaskIntoConstraints = false
        customView.addSubview(blotImage)
        NSLayoutConstraint.activate([
            blotImage.heightAnchor.constraint(equalToConstant: 120),
            blotImage.widthAnchor.constraint(equalToConstant: 120),
            blotImage.topAnchor.constraint(equalTo: customView.topAnchor, constant: 0),
            blotImage.leadingAnchor.constraint(equalTo: customView.leadingAnchor, constant: 0),
            blotImage.bottomAnchor.constraint(equalTo: customView.bottomAnchor, constant: 0),
        ])

        blotImage1.translatesAutoresizingMaskIntoConstraints = false
        customView.addSubview(blotImage1)
        NSLayoutConstraint.activate([
            blotImage1.heightAnchor.constraint(equalToConstant: 40),
            blotImage1.widthAnchor.constraint(equalToConstant: 64),
            blotImage1.leadingAnchor.constraint(equalTo: blotImage.trailingAnchor, constant: 50),
            blotImage1.bottomAnchor.constraint(equalTo: customView.bottomAnchor, constant: 0),
        ])

        blotImage2.translatesAutoresizingMaskIntoConstraints = false
        customView.addSubview(blotImage2)
        NSLayoutConstraint.activate([
            blotImage2.heightAnchor.constraint(equalToConstant: 80),
            blotImage2.widthAnchor.constraint(equalToConstant: 165),
            blotImage2.topAnchor.constraint(equalTo: customView.topAnchor, constant: 0),
            blotImage2.trailingAnchor.constraint(equalTo: customView.trailingAnchor, constant: 0),
        ])

        date.translatesAutoresizingMaskIntoConstraints = false
        customView.addSubview(date)
        NSLayoutConstraint.activate([
            date.centerYAnchor.constraint(equalTo: customView.centerYAnchor),
            date.leadingAnchor.constraint(equalTo: customView.leadingAnchor, constant: 17),
        ])

        gratitudeLabel.translatesAutoresizingMaskIntoConstraints = false
        customView.addSubview(gratitudeLabel)
        NSLayoutConstraint.activate([
            gratitudeLabel.topAnchor.constraint(equalTo: customView.topAnchor, constant: 20),
            gratitudeLabel.leadingAnchor.constraint(equalTo: customView.leadingAnchor, constant: 95),
            gratitudeLabel.trailingAnchor.constraint(equalTo: customView.trailingAnchor, constant: -10),
        ])

        textGratitudeLabel.translatesAutoresizingMaskIntoConstraints = false
        customView.addSubview(textGratitudeLabel)
        NSLayoutConstraint.activate([
            textGratitudeLabel.topAnchor.constraint(equalTo: gratitudeLabel.bottomAnchor, constant: 5),
            textGratitudeLabel.leadingAnchor.constraint(equalTo: gratitudeLabel.leadingAnchor, constant: 5),
            textGratitudeLabel.trailingAnchor.constraint(equalTo: customView.trailingAnchor, constant: -5),
        ])
    }
    
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: GratitudeModel) {
        date.text = model.date
        textGratitudeLabel.text = model.gratitude
    }
}
