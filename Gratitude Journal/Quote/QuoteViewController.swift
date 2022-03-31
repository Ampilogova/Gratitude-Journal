//
//  QuoteViewController.swift
//  Gratitude Journal
//
//  Created by Tatiana Ampilogova on 3/26/22.
//

import UIKit

class QuoteViewController: UIViewController {
    
    private var quoteService = QuoteService()
    private var quotes = Quotes(data: [:])
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Quotes of the day"
        label.font = .boldSystemFont(ofSize: 34)
        label.textColor = .customblackColor
        label.textAlignment = .left
        label.numberOfLines = 2
        return label
    }()
    
    private let quoteLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 28)
        label.textColor = .customblackColor
        label.textAlignment = .left
        label.numberOfLines = 10
        return label
    }()
    
    private let authorLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .customGrayColor
        label.textAlignment = .left
        return label
    }()
    
    private let quoteImage:  UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: "quote.image")
        return image
    }()
    
    private let lineImage:  UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: "line")?.withRenderingMode(.alwaysTemplate)
        image.tintColor = .customblackColor
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadQuote()
    }
    
    private func loadQuote() {
        quoteService.loadData { result in
            self.quotes = result
            DispatchQueue.main.async {
                self.randomElement(dict: self.quotes)
            }
        }
    }
    
    func randomElement(dict: Quotes) {
        let randomKey = dict.data.keys.randomElement()
        if let dict = dict.data[randomKey ?? ""] as? [String: Any],
           let model = QuoteModel.from(dict) {
            self.authorLabel.text = model.author
            self.quoteLabel.text = model.quote
        }
    }
    

    // MARK: - Navigation
    
    private func setupUI() {
        quoteImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(quoteImage)
        NSLayoutConstraint.activate([
            quoteImage.heightAnchor.constraint(equalToConstant: 250),
            quoteImage.topAnchor.constraint(equalTo: view.topAnchor),
            quoteImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            quoteImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: quoteImage.bottomAnchor, constant: 10),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        
        lineImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(lineImage)
        NSLayoutConstraint.activate([
            lineImage.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 10),
            lineImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            lineImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        quoteLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(quoteLabel)
        NSLayoutConstraint.activate([
            quoteLabel.topAnchor.constraint(equalTo: lineImage.bottomAnchor, constant: 10),
            quoteLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            quoteLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(authorLabel)
        NSLayoutConstraint.activate([
            authorLabel.topAnchor.constraint(equalTo: quoteLabel.bottomAnchor, constant: 16),
            authorLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        ])
        
    }

}
