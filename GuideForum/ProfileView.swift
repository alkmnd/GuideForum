//
//  ProfileView.swift
//  GuideForum
//
//  Created by 1234 on 26.03.2023.
//

import Foundation
import SwiftUI

struct ProfileView: View {
    let profileLinkNames: [String] = ["Saved Tutorials", "Folowers", "Following", "My Posts"]
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    VStack(spacing: 60){
                        ZStack {
                            RoundedRectangle(cornerRadius: 30, style: .continuous)
                                .foregroundStyle(.linearGradient(colors: [.green, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
                                .frame(width: 1000, height:200)
                            Image(systemName: "camera.circle.fill")
                                .resizable()
                                .frame(width: 150, height: 150)
                                .foregroundColor(.mint)
                                .clipShape(Circle())
                            
                        }
                        .offset(y: 40)
                        Text("Awesome Status")
                            .foregroundColor(Color(.darkGray))
                            .fixedSize()
                    }
                    ProfileLink()
                    Spacer()
                }
            }
            .navigationBarItems(
                leading:
                    Text("Profile")
                        .font(.body)
                        .fontWeight(.bold)
                        .foregroundColor(Color(.systemGray)),
                trailing: Image(systemName: "gearshape")
                        .resizable()
                        .frame(width: 30, height: 30))
            .navigationTitle("Some Name")
    
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
        
    }
}

struct ProfileLink: View {
    let profileLinkNames: [String] = ["Saved Tutorials", "Folowers", "Following", "My Posts"]
    var body: some View {
        VStack {
            ForEach(profileLinkNames, id: \.self) { profileLinkName in
                NavigationLink(destination: Text("")) {
                    VStack(spacing: 0) {
                        HStack {
                            Text(profileLinkName)
                            Spacer()
                            Image(systemName: "chevron.right")
                                .foregroundColor(Color(.systemGray3))
                        }
                        .contentShape(Rectangle())
                        .padding(EdgeInsets(top: 17, leading: 21, bottom: 17, trailing: 21))
                        Divider()// Add a divider
                    }
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
    }
        
}
