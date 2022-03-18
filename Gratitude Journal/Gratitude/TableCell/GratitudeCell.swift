//
//  GratitudeCell.swift
//  Gratitude Journal
//
//  Created by Tatiana Ampilogova on 1/9/22.
//

import UIKit

struct GratitudeCellModel {
    var text: String
}

class GratitudeCell: UITableViewCell {
    
    private let gratitudeLabel: UILabel = {
        let label = UILabel()
        label.text = "I am grateful for..."
        label.font = .systemFont(ofSize: 18.0)
        label.textAlignment = .left
        label.numberOfLines = 2
        return label
    }()
    
    let gratitudeTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = UIColor.white
        textView.font = .systemFont(ofSize: 16.0)
        textView.makeRounded()
        textView.dropShadow()
        return textView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        gratitudeLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(gratitudeLabel)
        NSLayoutConstraint.activate([
            gratitudeLabel.heightAnchor.constraint(equalToConstant: 20),
            gratitudeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            gratitudeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16)
        ])
        
        gratitudeTextView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(gratitudeTextView)
        NSLayoutConstraint.activate([
            gratitudeTextView.heightAnchor.constraint(equalToConstant: 200),
            gratitudeTextView.topAnchor.constraint(equalTo: gratitudeLabel.bottomAnchor, constant: 6),
            gratitudeTextView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            gratitudeTextView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            gratitudeTextView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configure(with model: GratitudeCellModel) {
        gratitudeTextView.text = model.text
        gratitudeTextView.layer.borderColor = UIColor.black.cgColor
        gratitudeTextView.backgroundColor = .red
    }
}


