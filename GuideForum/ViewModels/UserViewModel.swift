//
//  UserViewModel.swift
//  GuideForum
//
//  Created by 1234 on 17.04.2023.
//

import Foundation
import Combine

final class UserViewModel: ObservableObject {
    @Published var user = User(name: "Natasha Natasha", email: "blvantla@gmail.com")
    @Published var followers = [User]()
    @Published var followings = [User]()
    @Published var favoritePosts = [Post]()
}
