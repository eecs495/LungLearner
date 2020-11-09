//
//  PhysicalExam.swift
//  LungLearner
//
//  Created by Audrey Ladd on 10/7/20.
//

import SwiftUI

struct PhysicalExam: View {
    @EnvironmentObject var steps: Steps
    @State private var selectedCause: String = "Unsure"
    var caseData: CaseData
    
    @State var secondsHere: Int = 0
    var secondsTotal: Int
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    init(caseData: CaseData, secondsTotal: Int){
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.backgroundColor = UIColor(Color.lighterGray)
        UIScrollView.appearance().backgroundColor = UIColor(Color.lighterGray)
        self.caseData = caseData
        self.secondsTotal = secondsTotal
    }
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    ProgressCircles(coloredIndex: 2)
                    DiagnoseTimer(secondsHere: secondsHere, secondsTotal: secondsTotal)
                    .onReceive(timer) { _ in
                        self.secondsHere += 1
                    }
                }
                PhysicalExamText(caseData: caseData)
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
                    .padding(.vertical)
                    DiagnoseButtons(selectedCause: $selectedCause)
                    NavigationLink(destination: LabValues(caseData: caseData, secondsTotal: secondsHere + secondsTotal)) {
                        HStack {
                            Text("Lab Values")
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

struct PhysicalExam_Previews: PreviewProvider {
    static var previews: some View {
        PhysicalExam(caseData: testCaseData, secondsTotal: 90).environmentObject(Steps())
    }
}

struct PhysicalExamText: View {
    var caseData: CaseData
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Physical Exam")
                .font(.system(size: 35))
                .fontWeight(.semibold)
                .padding(.bottom, 5)
            PhysicalExamTextBody(caseData: caseData)
        }
        .padding(.horizontal, 30)
    }
}

struct PhysicalExamTextBody: View {
    var caseData: CaseData
    
    var body: some View {
        Group {
            DataBlock(title: "General", description: "\(caseData.physicalExamData.general)")
            DataBlock(title: "Head", description: "\(caseData.physicalExamData.head)")
            DataBlock(title: "Neck", description: "\(caseData.physicalExamData.neck)")
            DataBlock(title: "Heart", description: "\(caseData.physicalExamData.heart)")
            DataBlock(title: "Lungs", description: "\(caseData.physicalExamData.lungs)")
            DataBlock(title: "Abdomen", description: "\(caseData.physicalExamData.abdomen)")
            DataBlock(title: "Extremities", description: "\(caseData.physicalExamData.extremities)")
            DataBlock(title: "Skin", description: "\(caseData.physicalExamData.skin)")
        }
        .padding(.bottom, 5)
    }
}
