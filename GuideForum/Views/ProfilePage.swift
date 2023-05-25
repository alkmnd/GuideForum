//
//  ProfilePage.swift
//  GuideForum
//
//  Created by 1234 on 17.04.2023.
//

import Foundation
import SwiftUI

struct ProfilePage: View {
    let user: User
    @EnvironmentObject var dataManager: DataManager
    var body: some View {
        VStack {
            ProfileInfo(user: user)
            Button(action: {
                if dataManager.followings.contains(user) {
                    dataManager.followings.remove(at: dataManager.followings.firstIndex(of: user)!)
                } else {
                    dataManager.followings.append(user)
                }
            }) {
                if dataManager.followings.contains(user) {
                    Text("Unfollow")
                } else {
                    Text("Follow")
                }
            }.padding(.top, 5)
            PostList(posts:  dataManager.posts.filter({$0.creator == user.id.uuidString}), useSheet: true)
        }
    }
}

struct ProfilePage_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePage(user: User(name: "Куликов Макар", email: "makar@gmail.com"))
    }
}
