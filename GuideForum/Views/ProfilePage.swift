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
    @ObservedObject var userModel: UserViewModel
    @ObservedObject var dataModel: DataViewModel
    var body: some View {
        VStack {
            ProfileInfo(user: user)
            Button(action: {
                if userModel.followings.contains(user) {
                    userModel.followings.remove(at: userModel.followings.firstIndex(of: user)!)
                } else {
                    userModel.followings.append(user)
                }
            }) {
                if userModel.followings.contains(user) {
                    Text("Unfollow")
                } else {
                    Text("Follow")
                }
            }.padding(.top, 5)
            PostList(posts: dataModel.getPostByUserId(user: user), dataModel: dataModel, userModel: userModel)
        }
    }
}

struct ProfilePage_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePage(user: User(name: "Куликов Макар", email: "makar@gmail.com"), userModel: UserViewModel(), dataModel: DataViewModel())
    }
}
