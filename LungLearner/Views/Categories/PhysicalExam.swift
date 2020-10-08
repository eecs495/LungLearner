//
//  PhysicalExam.swift
//  LungLearner
//
//  Created by Audrey Ladd on 10/7/20.
//

import SwiftUI

struct PhysicalExam: View {
    var body: some View {
        VStack {
            Text("Physical Exam")
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

struct PhysicalExam_Previews: PreviewProvider {
    static var previews: some View {
        PhysicalExam()
    }
}
