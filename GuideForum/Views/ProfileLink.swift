//
//  ProfileLink.swift
//  GuideForum
//
//  Created by 1234 on 29.03.2023.
//
import SwiftUI

struct ProfileLink: View {
    
    @ObservedObject var userModel: UserViewModel
    @ObservedObject var dataModel: DataViewModel
    let profileLinkNames: [String] = ["Saved Tutorials", "Followers", "Following", "My Posts"]
    
    var body: some View {
            VStack {
                ForEach(profileLinkNames, id: \.self) { profileLinkName in
                    NavigationLink(destination: { switch profileLinkName {
                    case "Following":
                        FollowingsList(userModel: userModel, dataModel: dataModel).padding(.top, -180)
                    case "Followers":
                        FollowersList(userModel: userModel, dataModel: dataModel).padding(.top, -180)
                    case "Saved Tutorials":
                        PostList(posts: userModel.favoritePosts, dataModel: dataModel, userModel: userModel, useSheet: true).padding(.top, -180)
                    case "My Posts":
                        PostList(posts: dataModel.posts.filter{$0.creator == userModel.user.id.uuidString}, dataModel: dataModel, userModel: userModel, useSheet: true).padding(.top, -180)
                    default:
                        Text("Something wrong")
                    }
                    }
                    ) {
                        VStack(spacing: 0) {
                            HStack {
                                Text(profileLinkName)
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(Color(.systemGray3))
                            }
                            .contentShape(Rectangle())
                            .padding(EdgeInsets(top: 17, leading: 21, bottom: 17, trailing: 21))
                            Divider()
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
    }
        
}
