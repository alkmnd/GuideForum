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
    
    
    @EnvironmentObject var dataManager: DataManager
    
    // Create variable to dismiss this view.
    @Environment(\.isSearching) var isSearching
    @State var searchText = ""
    
    @State var filteredPosts = [Post]()
    
    @State var filteredUsers = [User]()
    
    var body: some View {
//        NavigationView {
            VStack() {
                NavigationStack {
                    SearchBar(text: $searchText)
                        .offset(y: -24)

                    List {
                        Section("Posts") {
                            ForEach(dataManager.posts.filter({searchText.isEmpty ? true : $0.title.contains(searchText)}), id: \.id) { post in
                                NavigationLink(destination: PostView(post: post)) {
                                    PostRow(post: post)
                                }
                            }
                        }
                        Section("Users") {
                            ForEach(dataManager.users.filter({searchText.isEmpty ? true : $0.name.contains(searchText)}), id: \.id) { user in
                                NavigationLink(destination: ProfilePage(user: user)) {
                                    UserCard(user: user)
                                }
                            }
                        }
                    }
//                    .offset(y: -20)
                    .frame(height: 600)
                }
                .navigationBarBackButtonHidden()
            }
            .offset(y: 10)
            .navigationBarBackButtonHidden()

        }
//    }
   
}

struct BrowseView_Previews: PreviewProvider {
    static var previews: some View {
        BrowseView()
        
    }
}
