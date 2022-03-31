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
        label.textColor = .customLabelColor
        label.textAlignment = .center
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "We are what we do"
        label.font = .boldSystemFont(ofSize: 30)
        label.textColor = .customYellowColor
        label.textAlignment = .center
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Thousand of people are usign Gratefuli for gratitude"
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .customLabelColor
        label.numberOfLines = 2
        label.textAlignment = .center
        return label
    }()
    
    private var signUpButton: UIButton = {
        var button = UIButton()
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(.customblackColor, for: .normal)
        button.backgroundColor = .customYellowColor
        button.makeCellRounded()
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: 50)
        ])
        button.addTarget(self, action: #selector(signUp), for: .touchUpInside)
        return button
    }()
    
    private var logInButton: UIButton = {
        var button = UIButton()
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.customblackColor, for: .normal)
        button.backgroundColor = .customLabelColor
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
    
    var emptyView: UIView = {
        let view = UIView()
        NSLayoutConstraint.activate([
            view.heightAnchor.constraint(equalToConstant: 350)
        ])
        return view
    }()
    
    var stackView = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = false
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
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        stackView.axis = .vertical
        stackView.spacing = 15
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -120)
        ])
        
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(subtitleLabel)
        stackView.addArrangedSubview(emptyView)
        stackView.addArrangedSubview(signUpButton)
        stackView.addArrangedSubview(logInButton)
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
