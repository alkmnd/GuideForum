//
//  SettingsView.swift
//  GuideForum
//
//  Created by 1234 on 17.04.2023.
//

import Foundation
import SwiftUI 

struct EditView: View {
    @Environment(\.dismiss) var dismiss
    @State private var name: String = "Awesome Name"
    @State private var status: String = "Awesome status"
    @State private var image: String = "camera.circle.fill"
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("", text: $name)
                    .fontWeight(.bold)
                    .font(.system(size: 25))
                    .padding(10)
                    .padding(.top, -20)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                Divider()
                TextField("",text: $status)
                    .font(.system(size: 20))
                //                    .padding(.top, -20)
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
                        //                        Image(systemName: "square.and.arrow.up.circle.fill")
                        //                            .resizable()
                        //                            .frame(width: 30, height: 30)
                        //                            .foregroundColor(Color(.systemGray))
                        Text("Save")
                        
                    })
            
        } .ignoresSafeArea()
    }
}

struct EditView_Previews: PreviewProvider {
    static var previews: some View {
        EditView()
        
    }
}


