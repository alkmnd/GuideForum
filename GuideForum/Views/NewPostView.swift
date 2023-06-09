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
    @State private var showingAlert = false
    @EnvironmentObject var dataManager: DataManager
    
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
                    
                    Button("") {
                                showingAlert.toggle()
                            }
                            .alert(isPresented: $showingAlert) {
                                Alert(title: Text("Incorrect input data!"), message: Text("Your title and description whould be longer than 5 symbols!"))
                            }
                    
                }

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
                        if title.count > 5 && description.count > 5 && content.count > 10 {
                            dataManager.posts.append(Post(title: title, description: description, content: content, creator: dataManager.userID!))
                            dismiss()
                        } else {
                            showingAlert = true
                        }
                
                    }){
                        Image(systemName: "square.and.arrow.up.circle.fill")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(Color(.systemGray))
                        
                    }).ignoresSafeArea()
        
                }
        .ignoresSafeArea()
    
        
    }
}

struct NewPostView_Previews: PreviewProvider {
    static var previews: some View {
        NewPostView()
        
    }
}

