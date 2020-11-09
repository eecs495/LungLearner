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
    
    @State private var inputNotes: String = "Enter notes here"
    let placeholderString: String = "Enter notes here"
    
    @State var secondsHere: Int = 0
    var secondsTotal: Int
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    init(caseData: CaseData, secondsTotal: Int) {
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.backgroundColor = UIColor(Color.lighterGray)
        UIScrollView.appearance().backgroundColor = UIColor(Color.lighterGray)
        UITextView.appearance().backgroundColor = .clear
        self.caseData = caseData
        self.secondsTotal = secondsTotal
    }
    
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
                    //.padding(.horizontal, 30)
                    if steps.stepList.count == 5 {
                        Group {
                            DataBlock(title: "After History", description: steps.stepList[0])
                            DataBlock(title: "After Symptoms", description: steps.stepList[1])
                            DataBlock(title: "After Physical Exam", description: steps.stepList[2])
                            DataBlock(title: "After Lab Values", description: steps.stepList[3])
                            DataBlock(title: "After X-Ray", description: steps.stepList[4])
                        }
                        .padding(.bottom, 5)
                    }
                    TextEditor(text: $inputNotes)
                        .padding()
                        .foregroundColor(self.inputNotes == placeholderString ? Color.gray : Color.primary)
                        .onTapGesture {
                                    if self.inputNotes == placeholderString {
                                      self.inputNotes = ""
                                    }
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(Color.white)
                        )
                        .padding(.top, 30)
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
                    .padding(.vertical)
                    DiagnoseButtons(selectedCause: $selectedCause)
                    NavigationLink(destination: Incorr(caseData: caseData)) {
                        HStack {
                            Text("Check")
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
}

struct DiagnoseCase_Previews: PreviewProvider {
    static var previews: some View {
        DiagnoseCase(caseData: testCaseData1, secondsTotal: 444)
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
