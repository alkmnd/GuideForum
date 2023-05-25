//
//  UserViewModel.swift
//  GuideForum
//
//  Created by 1234 on 17.04.2023.
//

import Foundation
import Combine

final class UserViewModel: ObservableObject {
    @Published var user = User(name: "Natasha Belova", email: "blvantla@gmail.com")
    @Published var followers = [User]()
    @Published var followings = [User]()
    @Published var favoritePosts = [Post]()
    
    init() {
        favoritePosts = [
            Post(title: "Drawing and Animation in Swift", description:
                    "Creating a badge by combining paths and shapes", content: "Users receive a badge whenever they visit a landmark in their list. Of course, for a user to receive a badge, you’ll need to create one. This tutorial takes you through the process of creating a badge by combining paths and shapes, which you then overlay with another shape that represents the location.If you want to create multiple badges for different kinds of landmarks, try experimenting with the overlaid symbol, varying the amount of repetition, or changing the various angles and scales.Follow the steps to build this project, or download the finished project to explore on your own.", creator: user.id.uuidString),
            Post(title: "Interfacing with UIKit", description:
                    "About using frameworks", content: "SwiftUI works seamlessly with the existing UI frameworks on all Apple platforms. For example, you can place UIKit views and view controllers inside SwiftUI views, and vice versa.This tutorial shows you how to convert the featured landmark from the home screen to wrap instances of UIPageViewController and UIPageControl. You’ll use UIPageViewController to display a carousel of SwiftUI views, and use state variables and bindings to coordinate data updates throughout the user interface.Follow the steps to build this project, or download the finished project to explore on your own.", creator: user.id.uuidString)
        ]
        
    }
}
