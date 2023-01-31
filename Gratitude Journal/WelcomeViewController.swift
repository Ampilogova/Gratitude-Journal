//
//  WelcomeViewController.swift
//  Gratitude Journal
//
//  Created by Tatiana Ampilogova on 3/30/22.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Gratefuli"
        label.font = .boldSystemFont(ofSize: 30)
        label.textColor = .systemGray6
        label.textAlignment = .center
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = loc("what.we.do")
        label.font = .boldSystemFont(ofSize: 30)
        label.textColor = .systemYellow
        label.textAlignment = .center
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 220, height: 50))
        label.text = loc("thousand.people")
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .systemGray6
        label.numberOfLines = 3
        label.textAlignment = .center
        return label
    }()
    
    private var signUpButton: UIButton = {
        var button = UIButton()
        button.setTitle(loc("signUp"), for: .normal)
        button.setTitleColor(.customblackColor, for: .normal)
        button.backgroundColor = .systemYellow
        button.makeCellRounded()
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
        button.addTarget(self, action: #selector(signUp), for: .touchUpInside)
        return button
    }()
    
    private var logInButton: UIButton = {
        var button = UIButton()
        button.setTitle(loc("logIn"), for: .normal)
        button.setTitleColor(.customblackColor, for: .normal)
        button.backgroundColor = .systemGray6
        button.makeCellRounded()
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
        button.addTarget(self, action: #selector(logIn), for: .touchUpInside)
        return button
    }()
    
    var backgroundImage: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "LaunchBackgroundImage")
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .customBackgroundColor
        setupUI()
    }

    private func setupUI() {
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backgroundImage)
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(subtitleLabel)
        NSLayoutConstraint.activate([
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            subtitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            subtitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            subtitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
        ])
        
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(signUpButton)
        NSLayoutConstraint.activate([
            signUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            signUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
        ])
        
        logInButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logInButton)
        NSLayoutConstraint.activate([
            logInButton.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 10),
            logInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            logInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            logInButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30)
        ])
        
    }
    
    @objc func signUp() {
        let vc = SignUpViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func logIn() {
        let vc = LogInViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
