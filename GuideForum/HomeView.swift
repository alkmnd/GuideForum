//
//  HomeView.swift
//  GuideForum
//
//  Created by 1234 on 29.03.2023.
//

import Foundation
import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
                ZStack {
                    VStack {
                        
                    }
                }
                .navigationTitle("For you")
                .navigationBarItems(
                    leading:
                        Text("Create new post")
                            .font(.body)
                            .fontWeight(.bold)
                            .foregroundColor(Color(.systemGray)),
                    trailing:
                        NavigationLink(destination: Text(""))  {
                            Image(systemName: "plus.circle")
                                .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(Color(.systemGray))
                        }
                        .buttonStyle(PlainButtonStyle()))
                        
                    }
        
            }

    }


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
        
    }
}

