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
    @ObservedObject var userModel: UserViewModel
    @ObservedObject var dataModel: DataViewModel
    var body: some View {
        NavigationStack {
            if userModel.followers.count == 0 {
                Text("Nothing here")
                    .foregroundColor(Color(.systemGray))
            } else {
                List {
                    ForEach(userModel.followers, id: \.id) { user in
                        NavigationLink(destination: ProfilePage(user: user, userModel: userModel, dataModel: dataModel)) {
                            UserCard(user: user, dataModel: dataModel)
                        }
                    }
                }
            }
        }
    }
}
