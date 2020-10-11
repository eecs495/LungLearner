//
//  LabValues.swift
//  LungLearner
//
//  Created by Audrey Ladd on 10/7/20.
//

import SwiftUI

struct LabValues: View {
    @EnvironmentObject var steps: Steps
    @State private var selectedCause = 0
    @State var showImage: Bool = false
    var caseData: CaseData
    
    var body: some View {
        ScrollView {
            ZStack {
                VStack {
                    Text("Lab Values")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        .padding(.top, 40)
                        .padding(.bottom)
                    Text("Click on the plus button below to view this patient's lab values.")
                        .multilineTextAlignment(.leading)
                        .font(.body)
                        .foregroundColor(.secondary)
                        .padding(.horizontal, 30)
                    Button(action: {
                        self.showImage.toggle()
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.largeTitle)
                    }
                    .padding(.vertical)
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
                    NavigationLink(destination: ArterialBloodGas(caseData: caseData)) {
                        Image(systemName: "arrow.right")
                            .font(.largeTitle)
                            .foregroundColor(Color.black)
                            .padding()
                            .padding(.bottom, 30)
                    }
                    .simultaneousGesture(TapGesture().onEnded{
                        steps.stepList.append(causes[selectedCause])
                    })
                }
                .blur(radius: self.showImage ? 5 : 0)
                if self.showImage {
                    VStack {
                        Image(caseData.labValuesName)
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

struct LabValues_Previews: PreviewProvider {
    static var previews: some View {
        LabValues(caseData: testCaseData).environmentObject(Steps())
    }
}
