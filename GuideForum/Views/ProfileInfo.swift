//
//  ProfileInfo.swift
//  GuideForum
//
//  Created by 1234 on 29.03.2023.
//

import Foundation
import SwiftUI

struct ProfileInfo: View {
    var user: User
    var body: some View {
        VStack(spacing: 20) {
            Text(user.name)
                .fontWeight(.bold)
                .font(.system(size: 25))
                .padding(.top, 20)
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
            Text("Hello everyone!")
                .foregroundColor(Color(.darkGray))
                .fixedSize()
        }
    }
}
