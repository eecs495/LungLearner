//
//  DiagnoseCase.swift
//  LungLearner
//
//  Created by Audrey Ladd on 10/16/20.
//

import SwiftUI

struct DiagnoseCase: View {
    @EnvironmentObject var steps: Steps
    @State private var selectedCause: String = "Unsure"
    
    var caseData: CaseData
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Thoughts so far...")
                    .font(.system(size: 35))
                    .fontWeight(.semibold)
                    .padding(.vertical)
                if steps.stepList.count == 5 {
                    StepListText(stepList: steps.stepList, index: 0)
                    StepListText(stepList: steps.stepList, index: 1)
                    StepListText(stepList: steps.stepList, index: 2)
                    StepListText(stepList: steps.stepList, index: 3)
                    StepListText(stepList: steps.stepList, index: 4)
                }
            }
            .padding(.horizontal, 30)
            Spacer()
            VStack {
                HStack {
                    Text("My final diagnosis is")
                        .font(.system(size: 20))
                    Text(selectedCause)
                        .font(.system(size: 20))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color.hotPink)
                }
                .padding(.bottom)
                DiagnoseButtons(selectedCause: $selectedCause)
                NavigationLink(destination: Incorr(caseData: caseData)) {
                    HStack {
                        Text("CHECK")
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
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

struct DiagnoseCase_Previews: PreviewProvider {
    static var previews: some View {
        DiagnoseCase(caseData: testCaseData1)
    }
}

struct StepListText: View {
    var stepList: [String]
    var index: Int
    
    var body: some View {
        HStack {
            Text(stepList[index])
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .foregroundColor(Color.hotPink)
            Text("after \(causeNames[index])")
        }
    }
}
