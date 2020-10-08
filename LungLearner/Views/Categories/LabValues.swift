//
//  LabValues.swift
//  LungLearner
//
//  Created by Audrey Ladd on 10/7/20.
//

import SwiftUI

struct LabValues: View {
    @State var showImage: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                Text("Lab Values")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                Text("Example description.")
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .padding()
                Button(action: {
                    self.showImage.toggle()
                }) {
                    Image(systemName: "plus.circle.fill")
                        .font(.largeTitle)
                }
                .padding(.bottom)
                .disabled(self.showImage)
            }
            .blur(radius: self.showImage ? 5 : 0)
            if self.showImage {
                VStack {
                    Image("LabValuesSample")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .overlay(Rectangle().stroke(Color.white, lineWidth: 4))
                        .shadow(radius: 10)
                    Button(action: {
                        self.showImage.toggle()
                    }) {
                        Image(systemName: "multiply.circle.fill")
                            .font(.largeTitle)
                            .foregroundColor(.red)
                    }
                    .shadow(radius: 10)
                    .padding()
                }
                .padding()
            }
        }
    }
}

struct LabValues_Previews: PreviewProvider {
    static var previews: some View {
        LabValues()
    }
}
