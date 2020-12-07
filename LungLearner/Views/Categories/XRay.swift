//
//  XRay.swift
//  LungLearner
//
//  Created by Audrey Ladd on 10/8/20.
//

import SwiftUI

struct XRay: View {
    var caseData: CaseData
    @Binding var stepsList: [String]
    
    @State var showImage: Bool = false
    let url = URL(string: "https://lungxrays.s3.amazonaws.com/208.jpg")!
    private let minZoom: CGFloat = 0.75
    private let maxZoom: CGFloat = 3.0
    @GestureState private var magnificationLevel: CGFloat = 1.0
    @State private var zoomLevel: CGFloat = 1.0

    @State var secondsHere: Int = 0
    var secondsTotal: Int
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State var showHint: Bool = false
    
    func setZoom(magnification: CGFloat) -> CGFloat {
        return max(min(self.zoomLevel * magnification, self.maxZoom), self.minZoom)
    }
        
    var body: some View {
            VStack {
                HStack {
                    ProgressCircles(coloredIndex: 4)
                    DiagnoseTimer(secondsHere: secondsHere, secondsTotal: secondsTotal)
                    .onReceive(timer) { _ in
                        self.secondsHere += 1
                    }
                }
                VStack(alignment: .leading) {
                    Text("X-Ray")
                        .font(.system(size: 35))
                        .fontWeight(.semibold)
                        .padding(.bottom, 5)
                    VStack(alignment: .center) {
                        AsyncImage(url: URL(string: "https://lungxrays.s3.amazonaws.com/\(caseData.caseId).jpg")!)
                            .aspectRatio(contentMode: .fit)
                        if !showHint {
                            Button(action: {
                                showHint = true
                            }) {
                                Text("Hint")
                                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            }
                            .buttonStyle(NarrowButtonStyle())
                            .padding(.horizontal, 100)
                            Text("Revealing hint will deduct 100 points.")
                                .font(.system(size: 15))
                                .foregroundColor(.gray)
                                .italic()
                        }
                    }
                    .padding(.vertical)
                    if showHint {
                        Text(caseData.cxrThoughts)
                            .textStyle(WhiteCard())
                    }
                }
                .padding(.horizontal, 30)
                Spacer()
                VStack {
                    HStack {
                        Text("My current diagnosis is")
                            .font(.system(size: 20))
                        Text(stepsList[4])
                            .font(.system(size: 20))
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(Color.hotPink)
                    }
                    .padding(.bottom)
                    DiagnoseButtons(stepsList: $stepsList, index: 4)
                    NavigationLink(destination: ReviewCase(caseData: caseData, receivedHint: showHint, stepsList: $stepsList, secondsTotal: secondsHere + secondsTotal)) {
                        HStack {
                            Text("Review Case")
                                .foregroundColor(Color.hotPink)
                            Image(systemName: "chevron.right")
                                .foregroundColor(Color.hotPink)
                        }
                        .padding(.vertical)
                    }
                }

        }
        .background(Color.lighterGray.ignoresSafeArea())
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

struct XRay_Previews: PreviewProvider {
    static var previews: some View {
        XRay(caseData: testCaseData, stepsList: .constant(testStepsList), secondsTotal: 244)
    }
}
