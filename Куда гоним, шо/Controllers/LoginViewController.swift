//
//  LoginViewController.swift
//  Куда гоним, шо
//
//  Created by Владимир Пройдаков on 14.05.2026.
//

import UIKit

class LoginViewController: UIViewController {
    
    //MARK: - Аутлеты
    @IBOutlet weak var appNameLabel: UILabel!
    @IBOutlet weak var loginLabel: UILabel!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var orLabel: UILabel!
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    
    private let contentStack = UIStackView()
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLoginUI()
        setupLoginLayout()
    }
    
    //MARK: - Настройка UI и Layout
    private func setupLoginUI() {
        
        loginButton.layer.cornerRadius = 1
        
        emailTextField.borderStyle = .none
        emailTextField.layer.cornerRadius = 5
        emailTextField.layer.borderWidth = 1
        emailTextField.layer.borderColor = UIColor.systemGray4.cgColor
        emailTextField.clipsToBounds = true
        
        passwordTextField.borderStyle = .none
        passwordTextField.layer.cornerRadius = 5
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.borderColor = UIColor.systemGray4.cgColor
        passwordTextField.clipsToBounds = true
        passwordTextField.isSecureTextEntry = true
        
    }
    
    private func setupLoginLayout() {
        appNameLabel.translatesAutoresizingMaskIntoConstraints = false
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        orLabel.translatesAutoresizingMaskIntoConstraints = false
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        
        
        contentStack.axis = .vertical
        contentStack.alignment = .fill
        contentStack.distribution = .fill
        contentStack.spacing = 15
        contentStack.translatesAutoresizingMaskIntoConstraints = false
        
        contentStack.addArrangedSubview(appNameLabel)
        contentStack.addArrangedSubview(loginLabel)
        contentStack.addArrangedSubview(emailTextField)
        contentStack.addArrangedSubview(passwordTextField)
        
        view.addSubview(contentStack)
        
        NSLayoutConstraint.activate([
            contentStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 45),
            contentStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -45),
            contentStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 45),
            
            loginButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 100),
            loginButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -100),
            loginButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -430),
            
            orLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 100),
            orLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -100),
            orLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -400),
            
            registerButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 100),
            registerButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -100),
            registerButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -365),
            
            emailTextField.heightAnchor.constraint(equalToConstant: 35),
            passwordTextField.heightAnchor.constraint(equalToConstant: 35)
        ])
        
        contentStack.setCustomSpacing(20, after: loginLabel)
    }
    
    
    //MARK: - Кнопки логина и регистрации
    @IBAction func loginButtonTapped(_ sender: UIButton) {
    
        guard
            let email = emailTextField.text,
            let password = passwordTextField.text
        else {
            return
        }
        
        //Проверка на пустые поля
        if email.isEmpty || password.isEmpty {
            showAlert(title: "Ошибка",
                      message: "Заполните все поля")
        }
        
        guard let savedUser = UserStorage.shared.getUser() else {
            showAlert(title: "Ошибка",
                      message: "Пользователь не найден")
            return
        }
        
        let savedPassword = KeychainService.shared.getPassword(for: email)
        
        //Проверка соответствия данных ввода и пуш в HomeViewController
        if savedUser.email == email && savedPassword == password {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            
            guard let homeVC = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController else {
                return
            }
            navigationController?.pushViewController(homeVC, animated: true)
        } else {
            showAlert(title: "Ошибка",
                      message: "Неверный логин или пароль")
        }
    }
    
    @IBAction func registerButtonTapped(_ sender: Any) {
        
        //Пуш в RegisterViewController
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        guard let registerVC = storyboard.instantiateViewController(withIdentifier: "RegisterViewController") as? RegisterViewController else { return }
        
        navigationController?.pushViewController(registerVC, animated: true)
    }
}

