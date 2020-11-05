//
//  DataBlock.swift
//  LungLearner
//
//  Created by Audrey Ladd on 10/16/20.
//

import SwiftUI

struct DataBlock: View {
    var title: String
    var description: String
    
    var body: some View {
        HStack(alignment: .top) {
            Text("\(title):")
                .fontWeight(.semibold)
            Text(description)
        }
    }
}

struct DataBlock_Previews: PreviewProvider {
    static var previews: some View {
        DataBlock(title: "Title", description: "Description Description Description Description Description Description Description Description")
    }
}
