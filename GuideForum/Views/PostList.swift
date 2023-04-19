
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
    @State private var showingSheet = false
    var useSheet: Bool
    var body: some View {
        NavigationStack {
            if posts.count == 0 {
                Text("Nothing here")
                
            } else {
                if !useSheet {
                    List {
                        ForEach(posts, id: \.id) { post in
                            NavigationLink(destination: PostView(post: post, dataModel: dataModel, userModel: userModel, postModel: PostViewModel(post: post))) {
                                PostRow(postModel: PostViewModel(post: post), userModel: userModel)
                            }
                        }
                    }
                } else {
                    List {
                        ForEach(posts, id: \.id) { post in
                            Button(action: {
                                showingSheet.toggle()
                            }) {
                                PostRow(postModel: PostViewModel(post: post), userModel: userModel)
                            }
                            .buttonStyle(PlainButtonStyle())
                            .sheet(isPresented: $showingSheet) {
                                PostView(post: post, dataModel: dataModel, userModel: userModel, postModel: PostViewModel(post: post))
                            }
                        }
                    }
                }
            }
        }
    }
}
