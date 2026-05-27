//
//  RegisterViewController+TextFieldValidation.swift
//  Куда гоним, шо
//
//  Created by Владимир Пройдаков on 27.05.2026.
//

import UIKit

//MARK: - Расширение для TextField
extension RegisterViewController: UITextFieldDelegate {
    
    func textField(_textField: UITextField,
                   shouldCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        
        let currentText = _textField.text ?? ""
        
        guard let stringRange = Range(range, in: currentText) else {
            return false
        }
        
        let updatedText = currentText.replacingCharacters(in: stringRange, with: string)
        
        //MARK: - Поле "Имя"
        if _textField == userNameTextField {
            let allowedCharacters = CharacterSet.letters.union(.whitespacesAndNewlines)
            let characterSet = CharacterSet(charactersIn: string)
            return allowedCharacters.isSuperset(of: characterSet) && updatedText.count <= 20
        }
        
        //MARK: - Поле "мейл"
        if _textField == userEmailTextField {
            
            //Без пробелов
            if updatedText.contains(" ") {
                return false
            }
            
            //Максимальная длинна
            return updatedText.count <= 40
        }
        
        //MARK: - Поле "пароль"
        if _textField == userPasswordTextField || _textField == userRepeatPasswordTextField {
            return updatedText.count <= 16
        }
        return true
    }
}
