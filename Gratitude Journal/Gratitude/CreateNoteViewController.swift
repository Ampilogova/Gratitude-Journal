//
//  GratitudeJournalViewController.swift
//  Gratitude Journal
//
//  Created by Tatiana Ampilogova on 3/24/22.
//

import UIKit
import Firebase

class CreateNoteViewController: UIViewController, UITextViewDelegate {
    
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
    
    private let cloudImage:  UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: "cloud")?.withRenderingMode(.alwaysTemplate)
        image.tintColor = .cloudImageColor
        return image
    }()
    
    private let bubbleImage: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: "bubble")?.withRenderingMode(.alwaysTemplate)
        image.tintColor = .circleImageColor
        return image
    }()
    
    private let bubbleImage1: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: "bubble")?.withRenderingMode(.alwaysTemplate)
        image.tintColor = .circleImageColor1
        return image
    }()
    private let bubbleImage2: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: "bubble")?.withRenderingMode(.alwaysTemplate)
        image.tintColor = .circleImageColor2
        return image
    }()
    
    private let bubbleImage3: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: "bubble")?.withRenderingMode(.alwaysTemplate)
        image.tintColor = .circleImageColor3
        return image
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .customBackgroundColor
        setupBackgroundImage()
        setupNavigationBar()
        setupUI()
        
        self.textView.delegate = self
        textView.becomeFirstResponder()
    }
    
    private func setupNavigationBar() {
        self.title = "Today"
        
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
            textView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 16),
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            textView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
        
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: 60),
            button.widthAnchor.constraint(equalToConstant: 60),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -25)
        ])
    }
    
    private func setupBackgroundImage() {
        bubbleImage3.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bubbleImage3)
        NSLayoutConstraint.activate([
            bubbleImage3.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 200),
            bubbleImage3.heightAnchor.constraint(equalToConstant: 492),
            bubbleImage3.widthAnchor.constraint(equalToConstant: 492),
            bubbleImage3.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -38),
            bubbleImage3.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 40),
        ])
        
        bubbleImage2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bubbleImage2)
        NSLayoutConstraint.activate([
            bubbleImage2.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 200),
            bubbleImage2.heightAnchor.constraint(equalToConstant: 422),
            bubbleImage2.widthAnchor.constraint(equalToConstant: 422),
            bubbleImage2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 3),
            bubbleImage2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
        ])
        
        bubbleImage1.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bubbleImage1)
        NSLayoutConstraint.activate([
            bubbleImage1.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 200),
            bubbleImage1.heightAnchor.constraint(equalToConstant: 354),
            bubbleImage1.widthAnchor.constraint(equalToConstant: 354),
            bubbleImage1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 31),
            bubbleImage1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -29),
        ])
        
        bubbleImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bubbleImage)
        NSLayoutConstraint.activate([
            bubbleImage.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 200),
            bubbleImage.heightAnchor.constraint(equalToConstant: 284),
            bubbleImage.widthAnchor.constraint(equalToConstant: 284),
            bubbleImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 66),
            bubbleImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -64)
        ])
        cloudImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cloudImage)
        NSLayoutConstraint.activate([
            cloudImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cloudImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            cloudImage.heightAnchor.constraint(equalToConstant: 100),
            cloudImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            cloudImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
        ])
    }
    

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    
    func textViewDidChange(_ textView: UITextView) {

    }
    // MARK: - Navigation
    
    @objc private func saveData() {
        gratitudeService.saveData(gratitude: textView.text)
    }
}
