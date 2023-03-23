//
//  GuideForumApp.swift
//  GuideForum
//
//  Created by 1234 on 22.03.2023.
//

import SwiftUI
import Firebase

@main
struct GuideForumApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
