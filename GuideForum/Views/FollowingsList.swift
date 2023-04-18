//
//  FollowingsList.swift
//  GuideForum
//
//  Created by 1234 on 18.04.2023.
//

import Foundation
import SwiftUI

struct FollowingsList: View {
    @ObservedObject var userModel: UserViewModel
    @ObservedObject var dataModel: DataViewModel
    var body: some View {
        NavigationStack {
            if userModel.followings.count == 0 {
                Text("Nothing here")
                    .foregroundColor(Color(.systemGray))
            } else {
                List {
                    ForEach(userModel.followings, id: \.id) { user in
                        NavigationLink(destination: ProfilePage(user: user, userModel: userModel, dataModel: dataModel)) {
                            UserCard(creator: user, dataModel: dataModel)
                        }
                    }
                }
            }
        }
    }
}
