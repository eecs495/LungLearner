//
//  ArterialBloodGas.swift
//  LungLearner
//
//  Created by Audrey Ladd on 10/8/20.
//

import SwiftUI

struct ArterialBloodGas: View {
    var body: some View {
        VStack {
            Text("Arterial Blood Gas")
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

struct ArterialBloodGas_Previews: PreviewProvider {
    static var previews: some View {
        ArterialBloodGas()
    }
}
