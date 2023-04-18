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
    @ObservedObject var dataModel: DataViewModel
    var body: some View {
        VStack {
            ProfileInfo(user: user)
            PostList(posts: dataModel.getPostByUserId(user: user), dataModel: dataModel)
        }
    }
}

struct ProfilePage_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePage(user: User(name: "Куликов Макар", email: "makar@gmail.com"), dataModel: DataViewModel())
    }
}
