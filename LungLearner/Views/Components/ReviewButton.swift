//
//  ReviewButton.swift
//  LungLearner
//
//  Created by Audrey Ladd on 10/16/20.
//

import SwiftUI

struct ReviewButton: View {
    @Binding var showCategory: Bool
    @Binding var blurBackground: Bool
    var title: String
    
    var body: some View {
        Button(action: {
            self.showCategory.toggle()
            self.blurBackground.toggle()
        }) {
            Text(title)
        }
        .buttonStyle(WideButtonStyle())
    }
}

//struct ReviewButton_Previews: PreviewProvider {
//    static var previews: some View {
//        ReviewButton()
//    }
//}
