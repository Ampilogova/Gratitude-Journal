//
//  ButtonCell.swift
//  Gratitude Journal
//
//  Created by Tatiana Ampilogova on 3/15/22.
//

import UIKit

class ButtonCell: UITableViewCell {
    
    private let button: UIButton = {
        var button = UIButton()
        button.setTitle("Save", for: .normal)
        button.backgroundColor = UIColor.customRed
        button.makeRounded()
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        button.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(button)
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: 50),
            button.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 6),
            button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -6),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
