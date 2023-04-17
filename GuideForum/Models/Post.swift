//
//  Post.swift
//  GuideForum
//
//  Created by 1234 on 17.04.2023.
//

import Foundation


struct Post: Hashable, Codable, Identifiable  {
    var id = UUID()
    let title: String
    let description: String
    let text: String
    var isFavorite: Bool
    var creator: User
    
    mutating func changeFavorite() {
        if isFavorite == true {
            isFavorite = false
        } else {
            isFavorite = true
        }
    }
}
