//
//  ClosePopUpButton.swift
//  LungLearner
//
//  Created by Audrey Ladd on 10/16/20.
//

import SwiftUI

struct ClosePopUpButton: View {
    @Binding var showCategory: Bool
    @Binding var blurBackground: Bool
    
    var body: some View {
        Button(action: {
            self.showCategory.toggle()
            self.blurBackground.toggle()
        }) {
            Image(systemName: "multiply.circle.fill")
                .font(.largeTitle)
                .foregroundColor(.red)
                .padding(.vertical, 5)
        }
    }
}

//struct ClosePopUpButton_Previews: PreviewProvider {
//    static var previews: some View {
//        ClosePopUpButton()
//    }
//}
