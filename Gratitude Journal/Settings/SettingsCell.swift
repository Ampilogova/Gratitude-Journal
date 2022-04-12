//
//  SettingsCell.swift
//  Gratitude Journal
//
//  Created by Tatiana Ampilogova on 1/7/22.
//

import UIKit

class SettingsCell: UITableViewCell {
    
    typealias ConfigurationModel = Setting
    
    let nameSettingLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .left
        label.numberOfLines = 2
        return label
    }()
    
    private var icon: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .customBackgroundColor
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(icon)
        icon.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            icon.heightAnchor.constraint(equalToConstant: 20),
            icon.widthAnchor.constraint(equalToConstant: 20),
            icon.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            icon.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16)
        ])
        
        contentView.addSubview(nameSettingLabel)
        nameSettingLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameSettingLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            nameSettingLabel.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 10)
        ])
    }
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: Setting) {
        nameSettingLabel.text = model.name
        icon.image = model.icon
    }
}
