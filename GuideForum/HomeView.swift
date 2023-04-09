//
//  HomeView.swift
//  GuideForum
//
//  Created by 1234 on 29.03.2023.
//

import Foundation
import SwiftUI


struct Post: Hashable, Codable, Identifiable  {
    var id = UUID()
    let title: String
    let description: String
    let text: String
    var isFavorite: Bool
    
    mutating func changeFavorite(post: inout Post) {
        if isFavorite == true {
            isFavorite = false
        } else {
            isFavorite = true
        }
    }
}

//extension Post {
//    var isFavorite: Bool {
//        get {self.isFavorite}
//        set {
//            isFavorite = newValue...self.is
//        }
//    }
//
//}
struct HomeView: View {
    
    func changeFavorite(post: inout Post) {
        if post.isFavorite == true {
            post.isFavorite = false
        } else {
            post.isFavorite = true
        }
    }
    var posts = [
        Post(title: "Awesome title", description:
                "Description", text: "Even though Swift always had out of the box solution to this problem (without String extension, which I provided below), I still would strongly recommend using the extension. Why? Because it saved me tens of hours of painful migration from early versions of Swift, where String's syntax was changing almost every release, but all I needed to do was to update the extension's implementation as opposed to refactoring the entire project. Make your choice.", isFavorite: false),
        Post(title: "Awesome title", description:
                "Description", text: "Awesome text", isFavorite: false),
        Post(title: "Awesome title", description:
                "Description", text: "Awesome text", isFavorite: false)
    ]
    func getPreview(post: Post) -> String {
        var preview: String = ""
        if post.text.count < 15 {
            preview = post.text
        } else {
            //            preview = post.text.prefix(15)
            let index = post.text.index(post.text.startIndex, offsetBy: 15)
            preview = String(post.text.prefix(upTo: index))
        }
        return preview
    }
    var body: some View {
        NavigationView {
            NavigationStack {
                List {
                    //                    Section("Tutorials") {
                    ForEach( posts, id: \.id) { post in
                        NavigationLink(destination: PostView(post: post)) {
                            //                                Label(post.title, systemImage: "")
                            VStack(alignment: .leading) {
                                Text("\(post.title)")
                                    .foregroundColor(.black)
                                    .fontWeight(.bold)
                                    .font(.system(size: 34))
                                
                                Text("\(post.description)")
                                    .foregroundColor(Color(.systemGray))
                                    .font(.system(size: 26))
                                
                                Text("\(getPreview(post: post))...")
                                    .foregroundColor(.black)
                                    .font(.system(size: 26))
                                //                                    Button(action: {
                                //                                        changeFavorite(post: &post)
                                //
                                //                                    }) {
                                //                                        if post.isFavorite == false {
                                //
                                //                                            Image(systemName: "bookmark")
                                //                                                .resizable()
                                //                                                .frame(width: 30, height: 30)
                                //                                        } else {
                                //                                            Image(systemName: "bookmark.fill")
                                //                                                .resizable()
                                //                                                .frame(width: 30, height: 30)
                                //                                        }
                            }
                            
                            
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
                        NavigationLink(destination: Text(""))  {
                            Image(systemName: "plus.circle")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(Color(.systemGray))
                        }
                        .buttonStyle(PlainButtonStyle()))
            }
            
            
        }
        
    }
    
    
}
    
    
    
    
    
    
    
    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            HomeView()
            
        }
    }
    
    struct PostlineItem: View {
        var post: Post
        @State var isFavorite: Bool = false
        func getPreview() -> String {
            var preview: String = ""
            if post.text.count < 15 {
                preview = post.text
            } else {
                //            preview = post.text.prefix(15)
                let index = post.text.index(post.text.startIndex, offsetBy: 15)
                preview = String(post.text.prefix(upTo: index))
            }
            return preview
        }
        var body: some View {
            NavigationLink(value: post) {
                VStack(alignment: .leading) {
                    Text("\(post.title)")
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                        .font(.system(size: 34))
                    
                    Text("\(post.description)")
                        .foregroundColor(Color(.systemGray))
                        .font(.system(size: 26))
                    
                    Text("\(getPreview())...")
                        .foregroundColor(.black)
                        .font(.system(size: 26))
                    Button(action: {
                        if isFavorite == true {
                            isFavorite = false
                        }
                        else {
                            isFavorite = true
                        }
                        
                    }) {
                        if isFavorite == false {
                            
                            Image(systemName: "bookmark")
                                .resizable()
                                .frame(width: 30, height: 30)
                        } else {
                            Image(systemName: "bookmark.fill")
                                .resizable()
                                .frame(width: 30, height: 30)
                        }
                    }
                    
                }
            }
            .buttonStyle(PlainButtonStyle())
            .navigationDestination(for: Post.self) { post in PostView(post: post)
                
            }
            
            
            
        }
        
    }

