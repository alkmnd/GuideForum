//
//  LoginView.swift
//  GuideForum
//
//  Created by 1234 on 17.04.2023.
//

import Foundation
import SwiftUI
import Firebase

// Struct for showing view to sign up or sign in.
struct LoginView: View {
    
    @StateObject var dataManager = DataManager()
    // Fields to fill.
    @State private var email = ""
    @State private var password = ""
    @State private var name = ""
    @State var userIsLoggedIn = false
    
    var body: some View {
        // Choosing correct view to show.
        if dataManager.isLoggedIn {
            TabBarView()
        } else {
            content
        }
    }
    
    var content: some View {
        NavigationView {
            ZStack {
                Color.black
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .foregroundStyle(.linearGradient(colors: [.green, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
                    .frame(width: 1000, height:400)
                    .rotationEffect(.degrees(135))
                    .offset(y: -350)
                VStack(spacing: 20) {
                    Text("Welcome")
                        .foregroundColor(.white)
                        .font(.system(size:40, weight:.bold, design: .rounded))
                        .offset(x:-100, y: -100)
                    TextField("Name", text: $name)
                        .foregroundColor(.white)
                        .textFieldStyle(.plain)
                        .placeholder(when: name.isEmpty) {
                            Text("Name (if you don't have an account)")
                                .foregroundColor(.white)
                                .bold()
                        }
                    Rectangle()
                        .frame(width: 350, height: 1)
                        .foregroundColor(.white)
                    TextField("Email", text: $email)
                        .foregroundColor(.white)
                        .textFieldStyle(.plain)
                        .placeholder(when: email.isEmpty) {
                            Text("Email")
                                .foregroundColor(.white)
                                .bold()
                        }
                    Rectangle()
                        .frame(width: 350, height: 1)
                        .foregroundColor(.white)
                    SecureField("Password", text: $password)
                        .foregroundColor(.white)
                        .textFieldStyle(.plain)
                        .placeholder(when: password.isEmpty) {
                            Text("Password")
                                .foregroundColor(.white)
                                .bold()
                        }
                    Rectangle()
                        .frame(width: 350, height: 1)
                        .foregroundColor(.white)
                    
                    Button {
                        // sign up
                        dataManager.userCredentials.name = name
                        dataManager.userCredentials.email = email
                        dataManager.userCredentials.password = password
                        dataManager.registerUser()
                        
                        //                    register()
                    } label: {
                        Text("Sign up")
                            .bold()
                            .frame(width:200, height: 40)
                            .background(
                                RoundedRectangle(cornerRadius: 10, style: .continuous)
                                    .fill(.linearGradient(colors:[.mint, .blue ], startPoint:.top, endPoint: .bottomTrailing))
                            ).foregroundColor(.white)
                    }
                    .padding(.top)
                    .offset(y:100)
                    Button {
                        dataManager.userCredentials.name = name
                        dataManager.userCredentials.email = email
                        dataManager.userCredentials.password = password
                        dataManager.loginUser()
                    } label: {
                        Text("Already have an account? Login")
                            .bold()
                            .foregroundColor(.mint)
                        
                    }
                    .padding(.top)
                    .offset(y:110)
                }
                .frame(width: 350)
                
            }
            .ignoresSafeArea()
        }
    }
    
}
    extension  View {
        func placeholder<Content: View> (
            when shuldShow: Bool,
            alignment: Alignment = .leading,
            @ViewBuilder placeholder: () -> Content) -> some View {
                
                ZStack(alignment: alignment) {
                    placeholder().opacity(shuldShow ? 1: 0)
                    self
                }
            }
    }
    
