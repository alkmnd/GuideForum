//
//  ProfileView.swift
//  GuideForum
//
//  Created by 1234 on 26.03.2023.
//

import Foundation
import SwiftUI
import Firebase

// Showing user profile.
struct ProfileView: View {
    
    @State private var showingSheet = false

    @State private var isLoginShown = false
    
    @EnvironmentObject var dataManager: DataManager

    // Create variable to dismiss this view.
    @Environment(\.dismiss) var dismiss
    
    let profileLinkNames: [String] = ["Saved Tutorials", "Followers", "Following", "My Posts"]
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    ProfileInfo(user: dataManager.users.first(where: {$0.id.uuidString == dataManager.userID})!)
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
                    Button(action: {
                        showingSheet.toggle()
                
                    })  {
                        
                        Image(systemName: "gearshape")
                            .resizable()
                        .frame(width: 30, height: 30)}
                    .sheet(isPresented: $showingSheet) {
                        EditView()
                    }
                    .buttonStyle(PlainButtonStyle()))
                    
                }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
        
    }
}



