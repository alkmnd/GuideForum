//
//  User.swift
//  GuideForum
//
//  Created by 1234 on 17.04.2023.
//

import Foundation

struct User: Hashable, Codable, Identifiable {
    var id = UUID()
    var name: String
    var email: String
    var image: String
    
    
    init(name: String, email: String, image: String = "person.circle.fill") {
        self.name = name
        self.email = email
        self.image = image
    }
}
