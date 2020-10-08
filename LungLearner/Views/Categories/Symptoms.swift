//
//  Symptoms.swift
//  LungLearner
//
//  Created by Audrey Ladd on 10/7/20.
//

import SwiftUI

struct Symptoms: View {
    var body: some View {
        VStack {
            Text("Symptoms")
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

struct Symptoms_Previews: PreviewProvider {
    static var previews: some View {
        Symptoms()
    }
}
