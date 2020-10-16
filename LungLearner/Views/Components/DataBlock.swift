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
    var horizontal: Bool = false
    var last: Bool = false
    
    var body: some View {
        if horizontal {
            HStack {
                Text("\(title):")
                Text(description)
                    .font(.body)
                    .foregroundColor(.secondary)
            }
            .padding(.bottom, last ? 10 : 0)
        } else {
            VStack(alignment: .leading) {
                Text(title)
                Text(description)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .padding(.bottom, last ? 0 : 10)
            }
        }
    }
}

struct DataBlock_Previews: PreviewProvider {
    static var previews: some View {
        DataBlock(title: "Title", description: "Description")
    }
}
