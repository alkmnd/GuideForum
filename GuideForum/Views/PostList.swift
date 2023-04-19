//
//  PostList.swift
//  GuideForum
//
//  Created by 1234 on 17.04.2023.
//

import Foundation
import SwiftUI

struct PostList: View {
    var posts: [Post]
    @ObservedObject var dataModel: DataViewModel
    @ObservedObject var userModel: UserViewModel
    var body: some View {
        NavigationStack {
<<<<<<< HEAD
            if posts.count == 0 {
                Text("Nothing here")
                
            } else {
                List {
                    ForEach(posts, id: \.id) { post in
                        NavigationLink(destination: PostView(dataModel: dataModel, userModel: userModel, postModel: PostViewModel(post: post))) {
                            PostRow(postModel: PostViewModel(post: post), userModel: userModel)
                        }
=======
            List {
                ForEach(posts, id: \.id) { post in
                    NavigationLink(destination: PostView(post: post, dataModel: dataModel, userModel: userModel)) {
                        PostRow(postModel: PostViewModel(post: post))
>>>>>>> parent of 41c3274 (added some views)
                    }
                }
            }
        }
    }
}
