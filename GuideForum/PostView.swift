//
//  PostView.swift
//  GuideForum
//
//  Created by 1234 on 29.03.2023.
//

import Foundation
import SwiftUI

struct PostView: View {
    var post: Post
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10) {
            Text("\(post.title)")
//                .foregroundColor(.black)
                .fontWeight(.bold)
//                .font(.system(size: 34))
                .font(.title)
            
            Text("\(post.description)")
                .font(.subheadline)
                .foregroundColor(Color(.systemGray))
            GeometryReader {
                geometry in ScrollView() {
                    Text("\(post.text)")
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
        .offset(y: -50)
    }
}

struct PostView_Previews: PreviewProvider {
    static var post: Post = Post(title: "Awesome title", description: "Descripton", text: "Even though Swift always had out of the box solution to this problem (without String extension, which I provided below), I still would strongly recommend using the extension. Why? Because it saved me tens of hours of painful migration from early versions of Swift, where String's syntax was changing almost every release, but all I needed to do was to update the extension's implementation as opposed to refactoring the entire project. Make your choice.", isFavorite: false)
    static var previews: some View {
        PostView(post: post)
        
    }
}
