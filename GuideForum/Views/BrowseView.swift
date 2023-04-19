//
//  SearchView.swift
//  GuideForum
//
//  Created by 1234 on 09.04.2023.
//

import Foundation
import SwiftUI

// Shows View for search users or posts.
struct BrowseView: View {
    
    @ObservedObject var dataModel: DataViewModel
    @ObservedObject var userModel: UserViewModel
    
    // Create variable to dismiss this view.
    @Environment(\.isSearching) var isSearching
    @State var searchText = ""
    
    @State var filteredPosts = [Post]()
    
    @State var filteredUsers = [User]()
    
    var body: some View {
        VStack() {
            NavigationStack {
                SearchBar(text: $searchText)
                List {
                    Section("Posts") {
                        ForEach(dataModel.posts.filter({searchText.isEmpty ? true : $0.title.contains(searchText)}), id: \.id) { post in
                            NavigationLink(destination: PostView(post: post, dataModel: dataModel, userModel: userModel)) {
                                PostRow(postModel: PostViewModel(post: post), userModel: userModel)
                            }
                        }
                    }
                    Section("Users") {
                        ForEach(dataModel.users.filter({searchText.isEmpty ? true : $0.name.contains(searchText)}), id: \.id) { user in
                            NavigationLink(destination: ProfilePage(user: user, userModel: userModel, dataModel: dataModel)) {
                                UserCard(user: user, dataModel: dataModel)
                            }
                        }
                    }
                }
            }
        }
    }
   
}

struct BrowseView_Previews: PreviewProvider {
    static var previews: some View {
        BrowseView(dataModel: DataViewModel(), userModel: UserViewModel())
        
    }
}
