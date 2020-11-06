//
//  ProgressCircles.swift
//  LungLearner
//
//  Created by Audrey Ladd on 11/3/20.
//

import SwiftUI

struct ProgressCircles: View {
    var coloredIndex: Int
    var body: some View {
        HStack {
            Group {
                ForEach((0 ..< 5), id: \.self) {
                    Circle()
                        .fill($0 == coloredIndex ? Color.hotPink : Color(UIColor.systemGray4))
                    }
            }
            .frame(width: 15, height: 15)
            .padding()
        }
    }
}

struct ProgressCircles_Previews: PreviewProvider {
    static var previews: some View {
        ProgressCircles(coloredIndex: 2)
    }
}
