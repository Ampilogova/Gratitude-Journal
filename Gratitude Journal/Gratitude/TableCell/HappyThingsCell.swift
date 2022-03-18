//
//  HappyThingsSection.swift
//  Gratitude Journal
//
//  Created by Tatiana Ampilogova on 1/9/22.
//

import UIKit

struct HappyThingsCellModel {
    var text: String
}

class HappyThingsCell: UITableViewCell {
    
    private let happyThingsLabel: UILabel = {
        let label = UILabel()
        label.text = "Amazing things that happened today..."
        label.font = .systemFont(ofSize: 18.0)
        label.textAlignment = .left
        label.numberOfLines = 2
        return label
    }()
    
    let happyThingsTextField: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = UIColor.white
        textView.font = .systemFont(ofSize: 16.0)
        textView.makeRounded()
        textView.dropShadow()
        return textView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        happyThingsLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(happyThingsLabel)
        NSLayoutConstraint.activate([
            happyThingsLabel.heightAnchor.constraint(equalToConstant: 20),
            happyThingsLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            happyThingsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16)
        ])
        
        happyThingsTextField.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(happyThingsTextField)
        NSLayoutConstraint.activate([
            happyThingsTextField.heightAnchor.constraint(equalToConstant: 200),
            happyThingsTextField.topAnchor.constraint(equalTo: happyThingsLabel.bottomAnchor, constant: 6),
            happyThingsTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            happyThingsTextField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            happyThingsTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configure(with model: HappyThingsCellModel) {
        happyThingsTextField.text = model.text
    }
}
