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
    
    @EnvironmentObject var dataManager: DataManager
    
    var body: some View {
        NavigationView {
            NavigationStack {
                List {
                    ForEach(dataManager.posts, id: \.id) { post in
                        NavigationLink(destination: PostView(post: post)) {
                            PostRow(post: post)
                            
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
                            NewPostView()
                        })
            }
            
            
        }
        
    }
    
    
}
    

    
    
    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            HomeView()
            
        }
    }
    
