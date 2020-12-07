//
//  DiagnoseCase.swift
//  LungLearner
//
//  Created by Audrey Ladd on 10/16/20.
//

import SwiftUI

struct DiagnoseCase: View {
    var caseData: CaseData
    var receivedHint: Bool = false
    @Binding var stepsList: [String]
    
    @State private var inputNotes: String = "Enter notes here"
    let placeholderString: String = "Enter notes here"
    
    @State var secondsHere: Int = 0
    var secondsTotal: Int
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        ScrollView {
            VStack {
                VStack(alignment: .leading) {
                    HStack {
                        Text("Thoughts So Far")
                            .font(.system(size: 35))
                            .fontWeight(.semibold)
                            .padding(.vertical)
                        Spacer()
                        DiagnoseTimer(secondsHere: secondsHere, secondsTotal: secondsTotal)
                        .onReceive(timer) { _ in
                            self.secondsHere += 1
                        }
                    }
                    Group {
                        DataBlock(title: "After History", description: stepsList[0])
                        DataBlock(title: "After Symptoms", description: stepsList[1])
                        DataBlock(title: "After Physical Exam", description: stepsList[2])
                        DataBlock(title: "After Lab Values", description: stepsList[3])
                        DataBlock(title: "After X-Ray", description: stepsList[4])
                    }
                    .padding(.bottom, 5)
                    TextEditor(text: $inputNotes)
                        .font(.system(size: 20))
                        .padding()
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.white)
                        )
                        .foregroundColor(self.inputNotes == placeholderString ? Color.gray : Color.primary)
                        .onTapGesture {
                                    if self.inputNotes == placeholderString {
                                      self.inputNotes = ""
                                    }
                        }
                        .padding(.top, 30)
                }
                .padding(.horizontal, 30)
                Spacer()
                VStack {
                    HStack {
                        Text("My final diagnosis is")
                            .font(.system(size: 20))
                        Text(stepsList[5])
                            .font(.system(size: 20))
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundColor(Color.hotPink)
                    }
                    .padding(.vertical)
                    DiagnoseButtons(stepsList: $stepsList, index: 5, noUnsure: true)
                    NavigationLink(destination: Incorr(caseData: caseData, reason: inputNotes, stepsList: stepsList, receivedHint: receivedHint, secondsTotal: secondsTotal + secondsHere)) {
                        HStack {
                            Text("Check")
                                .foregroundColor(Color.hotPink)
                            Image(systemName: "chevron.right")
                                .foregroundColor(Color.hotPink)
                        }
                        .padding(.vertical)
                    }
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)

        }
        .onAppear {
            let navigationBarAppearance = UINavigationBarAppearance()
            navigationBarAppearance.backgroundColor = UIColor(Color.lighterGray)
            UIScrollView.appearance().backgroundColor = UIColor(Color.lighterGray)
            UITextView.appearance().backgroundColor = .clear
        }
    }
}

struct DiagnoseCase_Previews: PreviewProvider {
    static var previews: some View {
        let testSteps = Steps()
        testSteps.stepList = ["COPD", "Unsure", "CHF", "COPD", "Unsure"]
        return DiagnoseCase(caseData: testCaseData1, stepsList: .constant(testStepsList), secondsTotal: 444)
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
