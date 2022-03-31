//
//  GratitudeJournalViewController.swift
//  Gratitude Journal
//
//  Created by Tatiana Ampilogova on 3/24/22.
//

import UIKit
import Firebase

class CreateNoteViewController: UIViewController, UITextViewDelegate, Alert {
    
    private var gratitudeService = GratitudeService()
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "3 things I'm greatful for..."
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .customLabelColor
        label.textAlignment = .left
        label.numberOfLines = 2
        return label
    }()
    
    private let textView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .clear
        textView.font = .systemFont(ofSize: 19)
        textView.textColor = .customLabelColor
        textView.tintColor = .customYellowColor
        textView.isScrollEnabled = false
        return textView
    }()
    
    let button: UIButton = {
        var button = UIButton()
        button.setTitle("Save", for: .normal)
        button.setTitleColor(.customblackColor, for: .normal)
        button.backgroundColor = .customYellowColor
        button.makeRounded()
        button.addTarget(self, action: #selector(saveData), for: .touchUpInside)
        return button
    }()
    
    var backgroundImage: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "backgroundImage")
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    init(text: String) {
        self.textView.text = text
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "backgroundImage")!)
        setupNavigationBar()
        setupUI()
        self.textView.delegate = self
    }
    
    private func setupNavigationBar() {
        self.title = loc("today")
        
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .customBackgroundColor
        appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = .customLabelColor
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    private func setupUI() {
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backgroundImage)
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.heightAnchor.constraint(equalToConstant: 25),
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16)
        ])
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textView)
        self.textView.layoutManager.allowsNonContiguousLayout = false
        NSLayoutConstraint.activate([
            textView.heightAnchor.constraint(equalToConstant: 500),
            textView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 16),
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: 60),
            button.widthAnchor.constraint(equalToConstant: 60),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            button.bottomAnchor.constraint(equalTo: textView.bottomAnchor, constant: 25)
        ])
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    
    // MARK: - Navigation
    
    @objc private func saveData() {
        gratitudeService.saveData(gratitude: textView.text)
        self.showAlert(title: loc("Seccess"), message: loc("save"))
    }
}
