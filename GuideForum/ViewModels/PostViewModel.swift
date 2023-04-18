//
//  PostViewModel.swift
//  GuideForum
//
//  Created by 1234 on 17.04.2023.
//

import Foundation
import Combine

final class PostViewModel: ObservableObject {
    @Published var post: Post
    
//    @Published var user: User
    
    init(post: Post) {
//        self.user = user
        self.post = post
    }

}
