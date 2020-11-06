//
//  XRay.swift
//  LungLearner
//
//  Created by Audrey Ladd on 10/8/20.
//

import SwiftUI

struct XRay: View {
    @EnvironmentObject var steps: Steps
    @State private var selectedCause: String = "Unsure"
    @State var showImage: Bool = false
    
    private let minZoom: CGFloat = 0.75
    private let maxZoom: CGFloat = 3.0
    @GestureState private var magnificationLevel: CGFloat = 1.0
    @State private var zoomLevel: CGFloat = 1.0

    var caseData: CaseData
    
    func setZoom(magnification: CGFloat) -> CGFloat {
        return max(min(self.zoomLevel * magnification, self.maxZoom), self.minZoom)
    }
        
    var body: some View {
            VStack {
                ProgressCircles(coloredIndex: 4)
                VStack(alignment: .leading) {
                    Text("X-Ray")
                        .font(.system(size: 35))
                        .fontWeight(.semibold)
                        .padding(.bottom, 5)
                    Image(caseData.xRayName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
//                        .scaleEffect(setZoom(magnification: magnificationLevel))
//                        .gesture(MagnificationGesture().updating($magnificationLevel, body: { (value, state, _) in state = value }).onEnded({ (value) in self.zoomLevel = self.setZoom(magnification: value)})
//                            )
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
                    NavigationLink(destination: ReviewCase(caseData: caseData)) {
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
        XRay(caseData: testCaseData).environmentObject(Steps())
    }
}
