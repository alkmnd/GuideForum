//
//  FollowingsList.swift
//  GuideForum
//
//  Created by 1234 on 18.04.2023.
//
import Foundation
import SwiftUI

// Struct ro present followings in list.
struct FollowingsList: View {
    @EnvironmentObject var dataManager: DataManager
    @State private var showingSheet = false
    
    var body: some View {
        NavigationStack {
            if dataManager.followings.count == 0 {
                Text("Nothing here")
                    .foregroundColor(Color(.systemGray))
            } else {
                List {
                    ForEach(dataManager.followings, id: \.id) { user in
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
