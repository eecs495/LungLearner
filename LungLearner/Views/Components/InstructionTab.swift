//
//  InstructionTab.swift
//  LungLearner
//
//  Created by Audrey Ladd on 11/27/20.
//

import SwiftUI

struct InstructionTab: View {
    var image: String
    var description: String
    
    var body: some View {
        VStack {
            Image(systemName: image)
                .foregroundColor(Color.hotPink)
                .font(.system(size: 100))
                .padding(.bottom)
            Text(description)
                .font(.system(size: 20))
                .multilineTextAlignment(.center)
        }
    }
}

struct InstructionTab_Previews: PreviewProvider {
    static var previews: some View {
        InstructionTab(image: "heart.fill", description: "Example text.")
    }
}
