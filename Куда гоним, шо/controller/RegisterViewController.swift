//
//  RegisterViewController.swift
//  Куда гоним, шо
//
//  Created by Владимир Пройдаков on 14.05.2026.
//

import UIKit

class RegisterViewController: UIViewController {
    
    
    
    @IBOutlet weak var appNameRegisterLabel: UILabel!
    
    @IBOutlet weak var nameAndEmailLabel: UILabel!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var userEmailTextField: UITextField!
    
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var userPasswordTextField: UITextField!
    
    @IBOutlet weak var repeatPasswordLabel: UILabel!
    @IBOutlet weak var userRepeatPasswordTextField: UITextField!
    
    @IBOutlet weak var registerButton: UIButton!
    
    private let contentStackRegister = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupRegisterUI()
        setupRegisterLayout()
    }
    
    private func setupRegisterUI() {
        
        registerButton.layer.cornerRadius = 1
        
        userNameTextField.borderStyle = .none
        userNameTextField.layer.cornerRadius = 5
        userNameTextField.layer.borderWidth = 1
        userNameTextField.layer.borderColor = UIColor.systemGray4.cgColor
        userNameTextField.clipsToBounds = true
        
        userEmailTextField.borderStyle = .none
        userEmailTextField.layer.cornerRadius = 5
        userEmailTextField.layer.borderWidth = 1
        userEmailTextField.layer.borderColor = UIColor.systemGray4.cgColor
        userEmailTextField.clipsToBounds = true
        
        userPasswordTextField.borderStyle = .none
        userPasswordTextField.layer.cornerRadius = 5
        userPasswordTextField.layer.borderWidth = 1
        userPasswordTextField.layer.borderColor = UIColor.systemGray4.cgColor
        userPasswordTextField.clipsToBounds = true
        
        userRepeatPasswordTextField.borderStyle = .none
        userRepeatPasswordTextField.layer.cornerRadius = 5
        userRepeatPasswordTextField.layer.borderWidth = 1
        userRepeatPasswordTextField.layer.borderColor = UIColor.systemGray4.cgColor
        userRepeatPasswordTextField.clipsToBounds = true
    }
    
    private func setupRegisterLayout() {
        appNameRegisterLabel.translatesAutoresizingMaskIntoConstraints = false
        nameAndEmailLabel.translatesAutoresizingMaskIntoConstraints = false
        userNameTextField.translatesAutoresizingMaskIntoConstraints = false
        userEmailTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        userPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
        repeatPasswordLabel.translatesAutoresizingMaskIntoConstraints = false
        userRepeatPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        contentStackRegister.axis = .vertical
        contentStackRegister.alignment = .fill
        contentStackRegister.distribution = .fill
        contentStackRegister.spacing = 19
        contentStackRegister.translatesAutoresizingMaskIntoConstraints = false
        
        contentStackRegister.addArrangedSubview(appNameRegisterLabel)
        contentStackRegister.addArrangedSubview(nameAndEmailLabel)
        contentStackRegister.addArrangedSubview(userNameTextField)
        contentStackRegister.addArrangedSubview(userEmailTextField)
        contentStackRegister.addArrangedSubview(passwordLabel)
        contentStackRegister.addArrangedSubview(userPasswordTextField)
        contentStackRegister.addArrangedSubview(repeatPasswordLabel)
        contentStackRegister.addArrangedSubview(userRepeatPasswordTextField)
        
        view.addSubview(contentStackRegister)
        
        NSLayoutConstraint.activate([
            contentStackRegister.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 45),
            contentStackRegister.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -45),
            contentStackRegister.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 45),

            registerButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 100),
            registerButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -100),
            registerButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -95),
            
            userNameTextField.heightAnchor.constraint(equalToConstant: 30),
            userEmailTextField.heightAnchor.constraint(equalToConstant: 30),
            userPasswordTextField.heightAnchor.constraint(equalToConstant: 30),
            userRepeatPasswordTextField.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        contentStackRegister.setCustomSpacing(20, after: nameAndEmailLabel)
    }
    
    @IBAction func registerButtonTapped(_ sender: Any) {
    }
}
