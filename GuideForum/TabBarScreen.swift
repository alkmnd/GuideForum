//
//  TabBarScreen.swift
//  GuideForum
//
//  Created by 1234 on 24.03.2023.
//

import Foundation
import SwiftUI
struct HomeView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.red
            }
            .navigationTitle("Home")
        }
    }
}

struct ProfileView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.green
            }
            .navigationTitle("Profile")
        }
    }
}

struct BrowseView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color.blue
            }
            .navigationTitle("Browse")
        }
    }
}

struct TabBarScreenView: View {
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem{
                    Image(systemName: "house")
                    Text("Home")
                }
            
            BrowseView()
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

struct TabBarScreenView_Previews:  PreviewProvider {
    static var previews: some View {
        TabBarScreenView()
    }
    
}
