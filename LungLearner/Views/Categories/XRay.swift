//
//  XRay.swift
//  LungLearner
//
//  Created by Audrey Ladd on 10/8/20.
//

import SwiftUI

struct XRay: View {
    @EnvironmentObject var steps: Steps
    //@EnvironmentObject var timeToDiagnose: TimeToDiagnose
    @State private var selectedCause: String = "Unsure"
    @State var showImage: Bool = false
    let url = URL(string: "https://lungxrays.s3.amazonaws.com/208.jpg")!
    
    private let minZoom: CGFloat = 0.75
    private let maxZoom: CGFloat = 3.0
    @GestureState private var magnificationLevel: CGFloat = 1.0
    @State private var zoomLevel: CGFloat = 1.0

    var caseData: CaseData
    
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
                    AsyncImage(url: URL(string: "https://lungxrays.s3.amazonaws.com/\(caseData.caseId).jpg")!)
                        .aspectRatio(contentMode: .fit)
                    VStack {
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
                        Text(selectedCause)
                            .font(.system(size: 20))
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(Color.hotPink)
                    }
                    .padding(.bottom)
                    DiagnoseButtons(selectedCause: $selectedCause)
                    NavigationLink(destination: ReviewCase(caseData: caseData, secondsTotal: secondsHere + secondsTotal)) {
                        HStack {
                            Text("Review Case")
                                .foregroundColor(Color.hotPink)
                            Image(systemName: "chevron.right")
                                .foregroundColor(Color.hotPink)
                        }
                        .padding(.vertical)
                    }
                    .simultaneousGesture(TapGesture().onEnded {
                        steps.stepList.append(selectedCause)
                    })
                }

        }
        .background(Color.lighterGray.ignoresSafeArea())
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

struct XRay_Previews: PreviewProvider {
    static var previews: some View {
        XRay(caseData: testCaseData, secondsTotal: 244).environmentObject(Steps())
    }
}
