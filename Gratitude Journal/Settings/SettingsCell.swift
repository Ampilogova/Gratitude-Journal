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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(nameSettingLabel)
        nameSettingLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameSettingLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            nameSettingLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16)
        ])
    }
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: Setting) {
        nameSettingLabel.text = model.name
    }
}
