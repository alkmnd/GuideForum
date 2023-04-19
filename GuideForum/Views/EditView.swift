//
//  SettingsView.swift
//  GuideForum
//
//  Created by 1234 on 17.04.2023.
//

import Foundation
import SwiftUI 

// Shows view for editing user profile.
struct EditView: View {
    
    @ObservedObject var userModel: UserViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("", text: $userModel.user.name)
                    .fontWeight(.bold)
                    .font(.system(size: 25))
                    .padding(10)
                    .padding(.top, -20)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                Divider()
                TextField("",text: $userModel.user.status)
                    .font(.system(size: 20))
                    .foregroundColor(Color(.darkGray))
                    .padding(10)
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
            }
            .offset(y: -180)
            .ignoresSafeArea()
            .navigationBarItems(
                leading:
                    Text("Edit Profile")
                    .font(.body)
                    .fontWeight(.bold)
                    .foregroundColor(Color(.black)),
                trailing:
                    Button(action: {
                        dismiss()
                        
                    }){
                        Text("Save")
                        
                    })
            
        } .ignoresSafeArea()
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView(userModel: UserViewModel())
        
    }
}


