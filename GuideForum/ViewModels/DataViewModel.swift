//
//  DataViewModel.swift
//  GuideForum
//
//  Created by 1234 on 17.04.2023.
//

import Foundation
import Combine
import SwiftUI

final class DataViewModel: ObservableObject {
    @Published var users = [User]()
    
    @Published var posts = [Post]()
    
    init() {
       users =  [User(name: "Куликов Макар", email: "makar@gmail.com"),
                                User(name: "Кириллова Марианна", email: "marianna@gmail.com"),
                                User(name: "Белоусов Арсений", email: "makar@gmail.com")
                                
        ]
        
        posts = [
            Post(title: "How to use SwiftUI", description:
                    "Description", text: "Even though Swift always had out of the box solution to this problem (without String extension, which I provided below), I still would strongly recommend using the extension. Why? Because it saved me tens of hours of painful migration from early versions of Swift, where String's syntax was changing almost every release, but all I needed to do was to update the extension's implementation as opposed to refactoring the entire project. Make your choice.", isFavorite: false, creator: users[0]),
            Post(title: "Tutorial title", description:
                    "Description", text: "Awesome text", isFavorite: false, creator: users[1]),
            Post(title: "How to make a greate dinner", description:
                    "Description", text: "Awesome text", isFavorite: false, creator: users[2])
        ]
        
    }
    
    func getPostByUserId(user: User) -> [Post] {
        var postsFound = [Post]()
        for i in posts {
            if i.creator.id == user.id{
                postsFound.append(i)
            }
        }
        return postsFound
    }
}
