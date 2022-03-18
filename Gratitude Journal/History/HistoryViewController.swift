//
//  HistoryViewController.swift
//  Gratitude Journal
//
//  Created by Tatiana Ampilogova on 1/14/22.
//

import UIKit

class HistoryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, Configurable {
    
    var service = GratitudeService().history()
    private var viewModel = HistoryModelCell(date: "", gratitudeLabel: "I am grateful for...", textGratitudeLabel: "text", happyThingsLabel: "Amazing things that happened today...", textHappyThingsLabel: "")
    
    typealias ConfigurationModel = HistoryModelCell
    func configure(with model: HistoryModelCell) {
        viewModel = model
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setCollectionView()
    }
    
    private func setCollectionView() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let width = view.frame.width-20
        layout.itemSize = CGSize(width: width, height: width)
        
        let collectionView: UICollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView.register(HistoryCell.self, forCellWithReuseIdentifier: HistoryCell.className)
        collectionView.delegate = self
        collectionView.dataSource = self
        self.view.addSubview(collectionView)
        collectionView.pinToSuperview()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        service.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HistoryCell.className, for: indexPath) as! HistoryCell
        var model = viewModel
        let value = service[indexPath.row].value
        let date = service[indexPath.row].date
        model.textGratitudeLabel = value
        model.date = date
        cell.configure(with: model)
        return cell
    }
}
