//
//  FollowersList.swift
//  GuideForum
//
//  Created by 1234 on 18.04.2023.
//
import Foundation
import SwiftUI

// Strcut to present a list of followers.
struct FollowersList: View {
    
    @State private var showingSheet = false
    @EnvironmentObject var dataManager: DataManager
    
    var body: some View {
        NavigationStack {
            if dataManager.followers.count == 0 {
                Text("Nothing here")
                    .foregroundColor(Color(.systemGray))
            } else {
                List {
                    ForEach(dataManager.followers, id: \.id) { user in
                        Button(action: {
                            showingSheet.toggle()
                        }) {
                            UserCard(user: user)
                        }
                        .buttonStyle(PlainButtonStyle())
                        
                        .sheet(isPresented: $showingSheet) {
                            ProfilePage(user: user)
                        }
                    }
                }
            }
        }
    }
}
