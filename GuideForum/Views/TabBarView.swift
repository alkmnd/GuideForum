//
//  TabBarScreen.swift
//  GuideForum
//
//  Created by 1234 on 24.03.2023.
//

import Foundation
import SwiftUI



struct TabBarView: View {
    @ObservedObject var dataModel = DataViewModel()
    
    
    var body: some View {
        TabView {
            HomeView(dataModel: dataModel)
                .tabItem{
                    Image(systemName: "house")
                    Text("Home")
                }
            
            BrowseView(dataModel: dataModel)
                .tabItem {
                    Image(systemName: "sparkle.magnifyingglass")
                    Text("Browse")
                }
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person.circle.fill")
                    Text("Profile")
                }
        
        }
        
    }
}

struct TabBarView_Previews:  PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
    
}
