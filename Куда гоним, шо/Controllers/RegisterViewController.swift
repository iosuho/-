//
//  RegisterViewController.swift
//  Куда гоним, шо
//
//  Created by Владимир Пройдаков on 14.05.2026.
//

import UIKit

final class RegisterViewController: UIViewController {
    
    //MARK: - Аутлеты
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
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupRegisterUI()
        setupRegisterLayout()
        setupTextFields()
    }
    
    //MARK: - Настройка UI и Layout
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
        userPasswordTextField.isSecureTextEntry = true
        
        userRepeatPasswordTextField.borderStyle = .none
        userRepeatPasswordTextField.layer.cornerRadius = 5
        userRepeatPasswordTextField.layer.borderWidth = 1
        userRepeatPasswordTextField.layer.borderColor = UIColor.systemGray4.cgColor
        userRepeatPasswordTextField.clipsToBounds = true
        userRepeatPasswordTextField.isSecureTextEntry = true
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
            
            userNameTextField.heightAnchor.constraint(equalToConstant: 35),
            userEmailTextField.heightAnchor.constraint(equalToConstant: 35),
            userPasswordTextField.heightAnchor.constraint(equalToConstant: 35),
            userRepeatPasswordTextField.heightAnchor.constraint(equalToConstant: 35)
        ])
        
        contentStackRegister.setCustomSpacing(20, after: nameAndEmailLabel)
    }
    
    private func setupTextFields() {
        
        userNameTextField.delegate = self
        userEmailTextField.delegate = self
        userPasswordTextField.delegate = self
        userRepeatPasswordTextField.delegate = self
        
        //Тип клавиатуры для мейла
        userEmailTextField.keyboardType = .emailAddress
        
        //Автокоррекция
        userEmailTextField.autocorrectionType = .no
        
        userPasswordTextField.autocorrectionType = .no
        userRepeatPasswordTextField.autocorrectionType = .no
        
        //Авто заглавные буквы
        userEmailTextField.autocapitalizationType = .none
    }
    
    //MARK: - Кнопка регистрации и пуш в HomeViewController
    @IBAction func registerButtonTapped(_ sender: Any) {
        
        guard
            let name = userNameTextField.text,
            let email = userEmailTextField.text,
            let password = userPasswordTextField.text,
            let repeatPassword = userRepeatPasswordTextField.text
        else {
            return
        }
        
        //Проверка на заполнение полей
        if name.isEmpty || email.isEmpty || password.isEmpty || repeatPassword.isEmpty {
            showAlert(title: "Ошибка",
                      message: "Заполните все поля")
            return
        }
        
        //Проверка совпадения паролей
        if password != repeatPassword {
            showAlert(title: "Ошибка",
                      message: "Пароли не совпадают")
            return
        }
        
        //Валидация мейла
        if !isValidEmail(email) {
            showAlert(title: "Ошибка",
                      message: "Некорректный Email")
            return
        }
        
        //Длинна пароля
        if password.count < 6 {
            showAlert(title: "Ошибка",
                      message: "Пароль должен быть больше 6 символов")
            return
        }
        
        //Проверка наличия пользователей с одним email
        if let existingUser = UserStorage.shared.getUser() {
            if existingUser.email == email {
                showAlert(title: "Ошибка",
                          message: "Такой пользователь уже существует")
                return
            }
        }
        
        let user = User(name: name, email: email)
        
        UserStorage.shared.saveUser(user)
        KeychainService.shared.savePassword(password, for: email)
        
        //Пуш на HomeViewController
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        guard let homeVC = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as? HomeViewController else {
            return
        }
        
        navigationController?.pushViewController(homeVC, animated: true)
    }
    
    //MARK: - Валидация
    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}
