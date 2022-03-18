//
//  MoodCell.swift
//  Gratitude Journal
//
//  Created by Tatiana Ampilogova on 1/9/22.
//

import UIKit

class MoodCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    private let moodArray = ["\u{1F929}", "\u{1F642}", "\u{1F610}", "\u{1F641}", "\u{1F62D}"]

    private let moodLabel: UILabel = {
        let label = UILabel()
//        label.textColor = UIColor.gray
        label.text = "How Did I feel today?"
        label.font = .systemFont(ofSize: 18.0)
        label.textAlignment = .left
        label.numberOfLines = 2
        return label
    }()
    
    private let moodView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.makeRounded()
        return view
    }()
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
        collectionView.register(MoodCollectionCell.self, forCellWithReuseIdentifier: MoodCollectionCell.className)
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        moodLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(moodLabel)
        NSLayoutConstraint.activate([
            moodLabel.heightAnchor.constraint(equalToConstant: 20),
            moodLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            moodLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16)
        ])
        
        moodView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(moodView)
        NSLayoutConstraint.activate([
            moodView.topAnchor.constraint(equalTo: moodLabel.bottomAnchor, constant: 10),
            moodView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            moodView.trailingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: -16),
            moodView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            moodView.heightAnchor.constraint(equalToConstant: 50),
            moodView.widthAnchor.constraint(equalToConstant: 350),
        ])
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        moodView.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: moodView.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: moodView.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: moodView.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: moodView.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func collectionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 2,
                                           left: 2,
                                           bottom: 2,
                                           right: 2)
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 6
        layout.minimumLineSpacing = 12
        layout.itemSize = CGSize(width: 60, height: 60)
        
        return layout
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return moodArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MoodCollectionCell.className, for: indexPath) as! MoodCollectionCell
        let model = moodArray[indexPath.row]
        cell.configure(emoji: model)
        return cell
    }
}
