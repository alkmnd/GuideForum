//
//  SearchBar.swift
//  GuideForum
//
//  Created by 1234 on 18.04.2023.
//

import Foundation
import SwiftUI
 
// Custom search bar.
struct SearchBar: View {
    
    // input text.
    @Binding var text: String
 
    // Shows that text is editing currently.
    @State private var isEditing = false
 
    var body: some View {
        NavigationView() {
            HStack {
                TextField("Search ...", text: $text)
                    .padding(7)
                    .padding(.horizontal, 25)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .overlay(
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 8)
                            
                            if isEditing {
                                Button(action: {
                                    self.text = ""
                                }) {
                                    Image(systemName: "multiply.circle.fill")
                                        .foregroundColor(.gray)
                                        .padding(.trailing, 8)
                                }
                            }
                        }
                    )
                    .padding(.horizontal, 10)
                    .onTapGesture {
                        self.isEditing = true
                    }
                
                if isEditing {
                    Button(action: {
                        self.isEditing = false
                        self.text = ""
                        
                    }) {
                        Text("Cancel")
                    }
                    .padding(.trailing, 10)
                    .transition(.move(edge: .trailing))
                    .animation(.default)
                    
                }
            }
        
            .ignoresSafeArea()
            .navigationBarBackButtonHidden()
        }
        .navigationBarBackButtonHidden()
        .ignoresSafeArea()
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant(""))
    }
}
