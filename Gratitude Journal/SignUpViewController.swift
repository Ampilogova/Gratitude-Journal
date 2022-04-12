//
//  SignUpViewController.swift
//  Gratitude Journal
//
//  Created by Tatiana Ampilogova on 3/29/22.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController, Alert {
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = loc("create.account")
        label.font = .boldSystemFont(ofSize: 24)
        label.textColor = .customblackColor
        label.textAlignment = .center
        return label
    }()
    
    private var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = loc("login")
        textField.makeCellRounded()
        NSLayoutConstraint.activate([
            textField.heightAnchor.constraint(equalToConstant: 60)
        ])
        return textField
    }()
    
    private var emailView: UIView = {
        let view = UIView()
        view.backgroundColor = .customCellBackgroundColor
        view.makeCellRounded()
        return view
    }()
    
    private var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = loc("password")
        textField.makeCellRounded()
        textField.isSecureTextEntry = true
        NSLayoutConstraint.activate([
            textField.heightAnchor.constraint(equalToConstant: 60)
        ])
        return textField
    }()
    
    private var passwordView: UIView = {
        let view = UIView()
        view.backgroundColor = .customCellBackgroundColor
        view.makeCellRounded()
        return view
    }()
    
    private var button: UIButton = {
        var button = UIButton()
        button.backgroundColor = .customBackgroundColor
        button.setTitle(loc("start"), for: .normal)
        button.makeCellRounded()
        button.addTarget(self, action: #selector(didTapSignUpButton), for: .touchUpInside)
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: 60)
        ])
        return button
    }()
    
    private var emptyView: UIView = {
        let view = UIView()
        NSLayoutConstraint.activate([
            view.heightAnchor.constraint(equalToConstant: 180)
        ])
        return view
    }()
    
    private var backgroundImage: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "logIn")
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
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
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -120)
        ])
        
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailView.addSubview(emailTextField)
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: emailView.topAnchor, constant: 5),
            emailTextField.leadingAnchor.constraint(equalTo: emailView.leadingAnchor, constant: 10),
            emailTextField.trailingAnchor.constraint(equalTo: emailView.trailingAnchor, constant: -5),
            emailTextField.bottomAnchor.constraint(equalTo: emailView.bottomAnchor, constant: -5)
        ])
        
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordView.addSubview(passwordTextField)
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: passwordView.topAnchor, constant: 5),
            passwordTextField.leadingAnchor.constraint(equalTo: passwordView.leadingAnchor, constant: 10),
            passwordTextField.trailingAnchor.constraint(equalTo: passwordView.trailingAnchor, constant: -5),
            passwordTextField.bottomAnchor.constraint(equalTo: passwordView.bottomAnchor, constant: -5)
        ])
        
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(emailView)
        stackView.addArrangedSubview(passwordView)
        stackView.addArrangedSubview(emptyView)
        stackView.addArrangedSubview(button)
    }
    
    @objc func didTapSignUpButton() {
        let signUpManager = FirebaseAuthManager()
        if let email = emailTextField.text, let password = passwordTextField.text {
            signUpManager.createUser(email: email, password: password) {[weak self]  success, error  in
                guard let `self` = self else { return }
                if success {
                    UserDefaults.standard.set("1", forKey: "isLogin")
                    let vc = TabBar()
                    self.navigationController?.pushViewController(vc, animated: true)
                } else {
                    self.showAlert(title: loc("error"), message: error)
                }
            }
        }
    }
}
