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
    
    init(post: Post) {
        self.post = post
    }

}
