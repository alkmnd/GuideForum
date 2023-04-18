//
//  ProfileView.swift
//  GuideForum
//
//  Created by 1234 on 26.03.2023.
//

import Foundation
import SwiftUI
import Firebase

struct ProfileView: View {
    @State private var showingSheet = false
    @ObservedObject var userModel: UserViewModel
//    @State var user: User
    @Environment(\.dismiss) var dismiss
    let profileLinkNames: [String] = ["Saved Tutorials", "Followers", "Following", "My Posts"]
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    ProfileInfo(user: userModel.user)
                    ProfileLink()
                    Spacer()
                    Button(action: {
                        let firebaseAuth = Auth.auth()
                        do {
                          try firebaseAuth.signOut()
//                            LoginView()
                            dismiss()
                        } catch let signOutError as NSError {
                          print("Error signing out: %@", signOutError)
                        }
                    }) {
                        Text("Sign out")
                    }
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
        ProfileView(userModel: UserViewModel())
        
    }
}



