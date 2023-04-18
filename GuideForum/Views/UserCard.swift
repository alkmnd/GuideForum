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
    let creator: User
    @ObservedObject var dataModel: DataViewModel
    
    var body: some View {
        HStack {
//            Button(action: {
//                showingSheet.toggle()
//            }) {
                Image(systemName: creator.image)
                Text(creator.name)
//            }
//            .sheet(isPresented: $showingSheet) {
//                ProfilePage(user: creator, dataModel: dataModel)
//            }
//            .buttonStyle(PlainButtonStyle())
        }
    }
}
