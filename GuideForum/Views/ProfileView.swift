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
                    ProfileInfo()
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
                trailing:
                    NavigationLink(destination: Text(""))  {
                        Image(systemName: "gearshape")
                            .resizable()
                        .frame(width: 30, height: 30)}
                    .buttonStyle(PlainButtonStyle()))
                    
                }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
        
    }
}



