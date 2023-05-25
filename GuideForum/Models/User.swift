//
//  User.swift
//  GuideForum
//
//  Created by 1234 on 17.04.2023.
//

import Foundation

// Структура для представления пользователя. 
struct User: Hashable, Codable, Identifiable {
    var id = UUID()
    var name: String
    var email: String
    
    
    init(name: String, email: String) {
        self.name = name
        self.email = email
    }
    
    enum CodingKeys: String, CodingKey {
           case id, name, email
       }
}
