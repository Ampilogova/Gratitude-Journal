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
        label.text = loc("3.things.greatful")
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
        textView.textContainer.maximumNumberOfLines = 15
        textView.textContainer.lineBreakMode = .byTruncatingTail
        return textView
    }()
    
    private let button: UIButton = {
        var button = UIButton()
        button.setTitle(loc("save.note"), for: .normal)
        button.setTitleColor(.customblackColor, for: .normal)
        button.backgroundColor = .customYellowColor
        button.makeCellRounded()
        button.addTarget(self, action: #selector(saveData), for: .touchUpInside)
        return button
    }()
    
    private var backgroundImage: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "backgroundImage")
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
            textView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 16),
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            textView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            textView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -160)
        ])
        
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: 50),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100)
        ])
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }

    
    // MARK: - Navigation
    
    @objc private func saveData() {
        alert()
    }
    
    private func alert()  {
         let alertController = UIAlertController(title: loc("success"), message: loc("save.gratitude"), preferredStyle: .alert)

        alertController.addAction(UIAlertAction(title: loc("ok"), style: .default, handler: { alert in
            self.gratitudeService.saveData(gratitude: self.textView.text)
            self.navigationController?.popToRootViewController(animated: true)
        }))
        present(alertController, animated: true, completion: nil)
    }
}
