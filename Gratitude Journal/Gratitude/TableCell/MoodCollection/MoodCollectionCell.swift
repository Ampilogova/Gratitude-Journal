//
//  MoodCell.swift
//  Gratitude Journal
//
//  Created by Tatiana Ampilogova on 1/21/22.
//

import UIKit

class MoodCollectionCell: UICollectionViewCell {
    
    private let emojiLabel: UILabel = {
        var label = UILabel()
        label.font = .systemFont(ofSize: 40)
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        emojiLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(emojiLabel)
        NSLayoutConstraint.activate([
            emojiLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            emojiLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(emoji: String) {
        emojiLabel.text = emoji
    }
}

