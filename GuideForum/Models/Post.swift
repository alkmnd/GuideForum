//
//  Post.swift
//  GuideForum
//
//  Created by 1234 on 17.04.2023.
//

import Foundation


struct Post: Hashable, Decodable, Identifiable {
    var id = UUID()
    let title: String
    let description: String
    let content: String
    var creator: String
    
    
    enum CodingKeys: String, CodingKey {
           case id, title, description, content, creator
       }
}
