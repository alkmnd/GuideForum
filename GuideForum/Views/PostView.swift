//
//  PostView.swift
//  GuideForum
//
//  Created by 1234 on 29.03.2023.
//

import Foundation
import SwiftUI

// Shows Post.
struct PostView: View {
    
    //    var post: Post
    @State private var showingSheet = false
    @ObservedObject var dataModel: DataViewModel
    @ObservedObject var userModel: UserViewModel
    @ObservedObject var postModel: PostViewModel
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10) {
            Button(action: {
                showingSheet.toggle()
            }) {
                UserCard(user: postModel.post.creator, dataModel: dataModel)
            }
            .sheet(isPresented: $showingSheet) {
                ProfilePage(user: postModel.post.creator, userModel: userModel, dataModel: dataModel)
                HStack {
                    Text("\(postModel.post.title)")
                        .fontWeight(.bold)
                        .font(.title)
                }
                
                Text("\(postModel.post.description)")
                    .font(.subheadline)
                    .foregroundColor(Color(.systemGray))
                GeometryReader {
                    geometry in ScrollView() {
                        Text("\(postModel.post.text)")
                            .lineLimit(nil)
                            .frame(
                                minWidth: geometry.size.width,
                                idealWidth: geometry.size.width,
                                maxWidth: geometry.size.width,
                                minHeight: geometry.size.height,
                                idealHeight: geometry.size.height,
                                maxHeight: .infinity,
                                alignment: .topLeading)
                    }
                }
                
            }
            .padding()
        }
    }
}
    
    struct PostView_Previews: PreviewProvider {
        static var post: Post = Post(title: "Awesome title", description: "Descripton", text: "Even though Swift always had out of the box solution to this problem (without String extension, which I provided below), I still would strongly recommend using the extension. Why? Because it saved me tens of hours of painful migration from early versions of Swift, where String's syntax was changing almost every release, but all I needed to do was to update the extension's implementation as opposed to refactoring the entire project. Make your choice.", isFavorite: false, creator: User(name:"Лапина Кира", email: "kira@gmail.com"))
        static var previews: some View {
            PostView(dataModel: DataViewModel(), userModel: UserViewModel(), postModel: PostViewModel(post: post))
            
        }
    }

