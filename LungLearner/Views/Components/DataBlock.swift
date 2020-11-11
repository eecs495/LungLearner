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
    var unit: String = ""
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("\(title)")
                    .foregroundColor(Color.hotPink)
                    .fontWeight(.semibold)
                    .padding(.bottom, 1)
                HStack(alignment: .lastTextBaseline) {
                    Text(description)
                        .font(.system(size: 20))
                    if unit != "" {
                        Text(unit)
                            .foregroundColor(Color.gray)
                            .font(.system(size: 15))
                    }
                }
            }
            Spacer()
        }
        .padding()
        .frame(minWidth: 0, maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
        )
    }
}

struct DataBlock_Previews: PreviewProvider {
    static var previews: some View {
        DataBlock(title: "Title", description: "77", unit: "mm Hg")
    }
}
