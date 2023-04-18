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
    let profileLinkNames: [String] = ["Saved Tutorials", "Folowers", "Following", "My Posts"]
    var body: some View {
        VStack {
            ForEach(profileLinkNames, id: \.self) { profileLinkName in
                NavigationLink(destination: { if profileLinkName == "Following"{ FollowingsList(userModel: userModel, dataModel: dataModel)} else {
                    Text("")
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
