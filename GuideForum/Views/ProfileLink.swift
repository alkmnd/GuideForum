//
//  ProfileLink.swift
//  GuideForum
//
//  Created by 1234 on 29.03.2023.
//
import SwiftUI

struct ProfileLink: View {
    
    @EnvironmentObject var dataManager: DataManager
    let profileLinkNames: [String] = ["Saved Tutorials", "Followers", "Following", "My Posts"]
    
    var body: some View {
            VStack {
                ForEach(profileLinkNames, id: \.self) { profileLinkName in
                    NavigationLink(destination: { switch profileLinkName {
                    case "Following":
                        FollowingsList().padding(.top, -180)
                    case "Followers":
                        FollowersList().padding(.top, -180)
                    case "Saved Tutorials":
                        PostList(posts: dataManager.posts, useSheet: true).padding(.top, -180)
                    case "My Posts":
                        PostList(posts: dataManager.posts, useSheet: true).padding(.top, -180)
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
