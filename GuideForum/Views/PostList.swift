
//  PostList.swift
//  GuideForum
//
//  Created by 1234 on 17.04.2023.
//
import Foundation
import SwiftUI

struct PostList: View {
    var posts: [Post]
    @EnvironmentObject var dataManager: DataManager
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
                            NavigationLink(destination: PostView(post: post)) {
                                PostRow(post: post)
                            }
                        }
                    }
                } else {
                    List {
                        ForEach(posts, id: \.id) { post in
                            Button(action: {
                                showingSheet.toggle()
                            }) {
                                PostRow(post: post)
                            }
                            .buttonStyle(PlainButtonStyle())
                            .sheet(isPresented: $showingSheet) {
                                PostView(post: post)
                            }
                        }
                    }
                }
            }
        }
    }
}
