//
//  SearchView.swift
//  GuideForum
//
//  Created by 1234 on 09.04.2023.
//

import Foundation
import SwiftUI

struct BrowseView: View {
    @ObservedObject var dataModel: DataViewModel
    var body: some View {
        ZStack() {
            
        }
    }
   
}

struct BrowseView_Previews: PreviewProvider {
    static var previews: some View {
        BrowseView(dataModel: DataViewModel())
        
    }
}
