//
//  XRay.swift
//  LungLearner
//
//  Created by Audrey Ladd on 10/8/20.
//

import SwiftUI

struct XRay: View {
    @EnvironmentObject var steps: Steps
    @State private var selectedCause = 0
    @State var showImage: Bool = false
    
    var body: some View {
        ScrollView {
            ZStack {
                VStack {
                    Text("X-Ray")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        .padding(.top, 40)
                        .padding(.bottom)
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
                    VStack {
                         Picker(selection: $selectedCause, label: Text("Please choose a color")) {
                             ForEach(0 ..< causes.count) {
                                 Text(causes[$0])
                             }
                         }
                         Text("Current Diagnosis")
                             .bold()
                             .padding(.bottom, 2)
                         Text("\(causes[selectedCause])")
                             .font(.body)
                             .foregroundColor(.accentColor)
                    }
                    NavigationLink(destination: ReviewCase()) {
                        Image(systemName: "arrow.right")
                            .font(.largeTitle)
                            .foregroundColor(Color.black)
                            .padding()
                    }
                    .simultaneousGesture(TapGesture().onEnded{
                        steps.stepList.append(causes[selectedCause])
                    })
                }
                .blur(radius: self.showImage ? 5 : 0)
                if self.showImage {
                    VStack {
                        Image("XRaySample")
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
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

struct XRay_Previews: PreviewProvider {
    static var previews: some View {
        XRay().environmentObject(Steps())
    }
}
