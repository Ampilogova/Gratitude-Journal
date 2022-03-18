//
//  HistoryCell.swift
//  Gratitude Journal
//
//  Created by Tatiana Ampilogova on 1/14/22.
//

import UIKit

class HistoryCell: UICollectionViewCell, Configurable {
    
    typealias ConfigurationModel = HistoryModelCell
    
    private let date: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.gray
        label.font = UIFont(name: "ArialHebrew-Light", size: 18)
        label.textAlignment = .left
        label.numberOfLines = 2
        return label
    }()
    
    private let gratitudeLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.gray
        label.text = "I am grateful for..."
        label.font = UIFont(name: "ArialHebrew-Light", size: 18)
        label.textAlignment = .left
        label.numberOfLines = 2
        return label
    }()
    
    private let textGratitudeLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.gray
        label.font = UIFont(name: "ArialHebrew-Light", size: 18)
        label.textAlignment = .left
        label.numberOfLines = 10
        return label
    }()
    
    private let happyThingsLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.gray
        label.text = "Amazing things that happened today..."
        label.font = UIFont(name: "ArialHebrew-Light", size: 18)
        label.textAlignment = .left
        label.numberOfLines = 2
        return label
    }()
    
    private let textHappyThingsLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.gray
        label.font = UIFont(name: "ArialHebrew-Light", size: 18)
        label.textAlignment = .left
        label.numberOfLines = 10
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        let stackView = UIStackView(arrangedSubviews: [date, gratitudeLabel, textGratitudeLabel, happyThingsLabel, textHappyThingsLabel])
        stackView.axis = .vertical
        stackView.spacing = 2
        
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 7),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -7),
        ])
    }
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: HistoryModelCell) {
        date.text = model.date
        gratitudeLabel.text = model.gratitudeLabel
        textGratitudeLabel.text = model.textGratitudeLabel
        happyThingsLabel.text = model.happyThingsLabel
        textHappyThingsLabel.text = model.textHappyThingsLabel
    }
}
