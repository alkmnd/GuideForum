//
//  HomeView.swift
//  GuideForum
//
//  Created by 1234 on 29.03.2023.
//

import Foundation
import SwiftUI



struct HomeView: View {
    
    @State private var showingDetail = false
    @State private var showingSheet = false
    @ObservedObject var dataModel: DataViewModel
    @ObservedObject var userModel: UserViewModel
    
    func changeFavorite(post: inout Post) {
        if post.isFavorite == true {
            post.isFavorite = false
        } else {
            post.isFavorite = true
        }
    }
    
    func getPreview(post: Post) -> String {
        var preview: String = ""
        if post.text.count < 20 {
            preview = post.text
        } else {
            let index = post.text.index(post.text.startIndex, offsetBy: 20)
            preview = String(post.text.prefix(upTo: index))
        }
        return preview
    }
    var body: some View {
        NavigationView {
            NavigationStack {
                List {
                    ForEach(dataModel.posts, id: \.id) { post in
                        NavigationLink(destination: PostView(post: post, dataModel: dataModel, userModel: userModel )) {
                            PostRow(postModel: PostViewModel(post: post))
                            
                        }
                
                    }
                }
                .navigationTitle("For you")
                .navigationBarItems(
                    leading:
                        Text("Create new post")
                        .font(.body)
                        .fontWeight(.bold)
                        .foregroundColor(Color(.systemGray)),
                    trailing:
                        Button(action: {
                            showingSheet.toggle()
                    
                        }){
                            Image(systemName: "plus.circle")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(Color(.systemGray))
                            
                        }
                        .sheet(isPresented: $showingSheet) {
                            NewPostView(dataModel: dataModel, userModel: userModel)
                        })
            }
            
            
        }
        
    }
    
    
}
    

    
    
    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            HomeView(dataModel: DataViewModel(), userModel: UserViewModel())
            
        }
    }
    
struct PostRow: View {
    @ObservedObject var postModel: PostViewModel
    func getPreview(post: Post) -> String {
        var preview: String = ""
        if postModel.post.text.count < 20 {
            preview = postModel.post.text
        } else {
            //            preview = post.text.prefix(15)
            let index = postModel.post.text.index(postModel.post.text.startIndex, offsetBy: 20)
            preview = String(postModel.post.text.prefix(upTo: index))
        }
        return preview
    }
    var body: some View {            VStack(alignment: .leading) {
        Text("\(postModel.post.title)")
            .foregroundColor(.black)
            .fontWeight(.bold)
            .font(.system(size: 34))
        
        Text("\(postModel.post.description)")
            .foregroundColor(Color(.systemGray))
            .font(.system(size: 26))
        
        Text("\(getPreview(post: postModel.post))...")
            .foregroundColor(.black)
            .font(.system(size: 26))
        Button(action: {
            if postModel.post.isFavorite == false {
                postModel.post.isFavorite = true
            } else {
                postModel.post.isFavorite = false
            }
        }) {
            if postModel.post.isFavorite == false {
                Image(systemName: "bookmark")
                    .resizable()
                    .frame(width: 30, height: 30)
            } else {
                Image(systemName: "bookmark.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
                
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
        
        
    }
}

