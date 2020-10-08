//
//  History.swift
//  LungLearner
//
//  Created by Audrey Ladd on 10/7/20.
//

import SwiftUI

struct History: View {
    var body: some View {
        VStack {
            Text("History")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.primary)
            Text("Example description.")
                .multilineTextAlignment(.center)
                .font(.body)
                .foregroundColor(.secondary)
                .padding()
        }
    }
}

struct History_Previews: PreviewProvider {
    static var previews: some View {
        History()
    }
}
