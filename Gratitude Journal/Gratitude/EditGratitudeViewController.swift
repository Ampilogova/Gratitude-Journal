//
//  EditGratitudeViewController.swift
//  Gratitude Journal
//
//  Created by Tatiana Ampilogova on 4/1/22.
//

import UIKit

class EditGratitudeViewController: UIViewController, UITextViewDelegate, Alert {
    
    private var gratitudeService = GratitudeService()
    private var date = String()
    private var key = String()
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = loc("was.grateful")
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
    
    let updateButton: UIButton = {
        var button = UIButton()
        button.setTitle(loc("update"), for: .normal)
        button.setTitleColor(.customblackColor, for: .normal)
        button.backgroundColor = .customYellowColor
        button.makeCellRounded()
        button.addTarget(self, action: #selector(update), for: .touchUpInside)
        return button
    }()
    
    let deleteButton: UIButton = {
        var button = UIButton()
        button.setImage(UIImage(systemName: "trash"), for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(deleteValue), for: .touchUpInside)
        return button
    }()
    
    var backgroundImage: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "backgroundImage")
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    init(text: String, date: String , key: String) {
        self.textView.text = text
        self.key = key
        self.date = date
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupUI()
        self.textView.delegate = self
    }
    
    private func setupNavigationBar() {
        self.title = loc("edit.gratitude")
        
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
        
        updateButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(updateButton)
        NSLayoutConstraint.activate([
            updateButton.heightAnchor.constraint(equalToConstant: 50),
            updateButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            updateButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
        
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(deleteButton)
        NSLayoutConstraint.activate([
            deleteButton.heightAnchor.constraint(equalToConstant: 60),
            deleteButton.widthAnchor.constraint(equalToConstant: 60),
            deleteButton.topAnchor.constraint(equalTo: updateButton.bottomAnchor, constant: 5),
            deleteButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            deleteButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -6)
        ])
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }

    
    // MARK: - Navigation
    
    @objc private func update() {
        gratitudeService.editData(key: key, value: textView.text)
        self.showAlert(title: loc("done"), message: loc("save.update"))
    }
    
    @objc private func deleteValue() {
        deleteAlert(title: "", message: loc("delete.gratetude"))
    }
    
    private func deleteAlert(title: String, message: String)  {
         let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: loc("cancel"), style: .cancel, handler: nil))
        alertController.addAction(UIAlertAction(title: loc("delete"), style: .default, handler: { alert in
            self.gratitudeService.removeData(key: self.key)
            self.navigationController?.popToRootViewController(animated: true)
        }))
        present(alertController, animated: true, completion: nil)
    }

}
