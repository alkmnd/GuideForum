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
       users =  [User(name: "Kulykov Makar", email: "makar@gmail.com"),
                                User(name: "Kirillova Marianna", email: "marianna@gmail.com"),
                                User(name: "Belousov Arseniy", email: "makar@gmail.com")
                                
        ]
        
        posts = [
            Post(title: "Drawing and Animation in Swift", description:
                    "Creating a badge by combining paths and shapes", content: "Users receive a badge whenever they visit a landmark in their list. Of course, for a user to receive a badge, you’ll need to create one. This tutorial takes you through the process of creating a badge by combining paths and shapes, which you then overlay with another shape that represents the location.If you want to create multiple badges for different kinds of landmarks, try experimenting with the overlaid symbol, varying the amount of repetition, or changing the various angles and scales.Follow the steps to build this project, or download the finished project to explore on your own.", creator: users[0].id.uuidString),
            Post(title: "Interfacing with UIKit", description:
                    "About using frameworks", content: "SwiftUI works seamlessly with the existing UI frameworks on all Apple platforms. For example, you can place UIKit views and view controllers inside SwiftUI views, and vice versa.This tutorial shows you how to convert the featured landmark from the home screen to wrap instances of UIPageViewController and UIPageControl. You’ll use UIPageViewController to display a carousel of SwiftUI views, and use state variables and bindings to coordinate data updates throughout the user interface.Follow the steps to build this project, or download the finished project to explore on your own.", creator: users[1].id.uuidString),
            Post(title: "How to make a greate dinner", description:
                    "Description", content: "Awesome text", creator: users[2].id.uuidString)
        ]
        
    }
    
    func getPostByUserId(user: User) -> [Post] {
        var postsFound = [Post]()
        for i in posts {
            if i.creator == user.id.uuidString {
                postsFound.append(i)
            }
        }
        return postsFound
    }
}
