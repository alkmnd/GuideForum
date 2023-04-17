//
//  NewPostView.swift
//  GuideForum
//
//  Created by 1234 on 11.04.2023.
//

import Foundation
import SwiftUI
import Combine

struct NewPostView: View {
    @State private var title = ""
    @State private var description = ""
    @State private var content = ""
    
    @Environment(\.dismiss) var dismiss
    
    let titleLimit = 30
    let descriptionLimit = 50
    
    func limitText(_ upper: Int, text: inout String) {
            if text.count > upper {
                text = String(text.prefix(upper))
            }
        }
    var body: some View {
        NavigationView {
                VStack(spacing: 20) {
                    TextField("For you title", text: $title, axis: .horizontal)
                        .fontWeight(.bold)
                        .onReceive(Just(title)) {
                            _ in limitText(titleLimit, text: &title)
                        }
                    Divider()
                    TextField("Add awesome description", text: $description, axis: .vertical)
                        .onReceive(Just(description)) {
                            _ in limitText(descriptionLimit, text: &description)
                        }
                    
                    Divider()
                    
                    TextField("Show something great!", text: $content, axis: .vertical)
                    
                }
//            .navigationTitle("New Post")

            .padding(20)
            .offset(y: -230)
            .navigationBarItems(
                leading:
                    Text("Create new post!")
                    .font(.body)
                    .fontWeight(.bold)
                    .foregroundColor(Color(.black)),
                trailing:
                    Button(action: {
                        dismiss()
                
                    }){
                        Image(systemName: "square.and.arrow.up.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(Color(.systemGray))
                        
                    }).ignoresSafeArea()
//                    .onTapGesture {
//                            self.presentationMode.wrappedValue.dismiss()
//                        })
        
                }
        .ignoresSafeArea()
    
        
    }
}

struct NewPostView_Previews: PreviewProvider {
    static var previews: some View {
        NewPostView()
        
    }
}

