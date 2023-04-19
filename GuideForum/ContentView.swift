//
//  ContentView.swift
//  GuideForum
//
//  Created by 1234 on 22.03.2023.
//

import SwiftUI
import Firebase

struct ContentView: View {
    @State private var email = ""
    @State private var password = ""
    @State var userIsLoggedIn = false
    var body: some View {
        LoginView()
    }
}
