//
//  HomeView.swift
//  GuideForum
//
//  Created by 1234 on 29.03.2023.
//

import Foundation
import SwiftUI


// Showing Home View from tab bar.
struct HomeView: View {
    
    @State private var showingDetail = false
    @State private var showingSheet = false
    @ObservedObject var dataModel: DataViewModel
    @ObservedObject var userModel: UserViewModel
    
    var body: some View {
        NavigationView {
            NavigationStack {
                List {
                    ForEach(dataModel.posts, id: \.id) { post in
                        NavigationLink(destination: PostView( dataModel: dataModel, userModel: userModel, postModel: PostViewModel(post: post) )) {
                            PostRow(postModel: PostViewModel(post: post), userModel: userModel)
                            
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
    

