//
//  UserStorage.swift
//  Куда гоним, шо
//
//  Created by Владимир Пройдаков on 15.05.2026.
//

import Foundation

final class UserStorage {
    
    static let shared = UserStorage()
    
    private init() {}
    
    private let userKey = "saved_user"
    
    func saveUser(_ user: User) {
        
        do {
            let data = try JSONEncoder().encode(user)
            
            UserDefaults.standard.set(data, forKey: userKey)
        } catch {
            print("Ошибка сохранения пользователя")
        }
    }
    
    func getUser() -> User? {
        
        guard let data = UserDefaults.standard.data(forKey: userKey) else {
            return nil
        }
        do {
            let user = try JSONDecoder().decode(User.self, from: data)
            return user
        } catch {
            print("Ошибка получения пользователя")
            return nil
        }
    }
}
