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
            List {
                ForEach(posts, id: \.id) { post in
                    NavigationLink(destination: PostView(post: post, dataModel: dataModel, userModel: userModel)) {
                        PostRow(postModel: PostViewModel(post: post))
                    }
                }
            }
        }
    }
}
