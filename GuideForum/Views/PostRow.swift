//
//  PostRow.swift
//  GuideForum
//
//  Created by 1234 on 18.04.2023.
//

import Foundation
import SwiftUI

// Struct to present a post in a row.
struct PostRow: View {
    
    @ObservedObject var postModel: PostViewModel
    @ObservedObject var userModel: UserViewModel
    
    // Getting a content preview.
    func getPreview(post: Post) -> String {
        var preview: String = ""
        if postModel.post.text.count < 20 {
            preview = postModel.post.text
        } else {
            let index = postModel.post.text.index(postModel.post.text.startIndex, offsetBy: 20)
            preview = String(postModel.post.text.prefix(upTo: index))
        }
        return preview
    }
    
    var body: some View {
        VStack(alignment: .leading) {
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
            
            // Check states.
            if  postModel.post.isFavorite == false {
                postModel.post.isFavorite = true
//                userModel.favoritePosts.append(postModel.post)
            } else {
//                userModel.favoritePosts.remove(at: userModel.favoritePosts.firstIndex(where: {$0.id == postModel.post.id})!)
                postModel.post.isFavorite = false
                                               
            }
        }) {
            
            // Choose correct button form.
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
