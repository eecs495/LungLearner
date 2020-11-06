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
                .font(.system(size: 20))
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
        }
        .buttonStyle(WideButtonStyle())
    }
}

//struct ReviewButton_Previews: PreviewProvider {
//    static var previews: some View {
//        ReviewButton()
//    }
//}
