//
//  CreatorCard.swift
//  GuideForum
//
//  Created by 1234 on 17.04.2023.
//
import Foundation
import SwiftUI

struct UserCard: View {
    @State private var showingSheet = false
    let user: User
    
    var body: some View {
        HStack {
                Image(systemName: "person.circle")
                Text(user.name)
        }
    }
}
