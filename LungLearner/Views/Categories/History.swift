//
//  History.swift
//  LungLearner
//
//  Created by Audrey Ladd on 10/7/20.
//

import SwiftUI



struct History: View {
    @EnvironmentObject var steps: Steps
    @State private var selectedCause: String = "Unsure"
    var caseData: CaseData
    
    //@EnvironmentObject var timeToDiagnose: TimeToDiagnose
    @State var secondsHere: Int = 0
    var secondsTotal: Int = 0
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State var stepsList: [String] = ["Unsure", "Unsure", "Unsure", "Unsure", "Unsure", "Unsure"]
    
    var body: some View {
            
        VStack {
//            ForEach(stepsList, id: \.self) { step in
//                Text(step)
//            }
            HStack {
                ProgressCircles(coloredIndex: 0)
                DiagnoseTimer(secondsHere: secondsHere, secondsTotal: secondsTotal)
                .onReceive(timer) { _ in
                    self.secondsHere += 1
                }
            }
            //Text(caseData.correctDiagnosis)
            HistoryText(caseData: caseData)
            Spacer()
            VStack {
                HStack {
                    Text("My current diagnosis is")
                        .font(.system(size: 20))
                    Text(stepsList[0])
                        .font(.system(size: 20))
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .foregroundColor(Color.hotPink)
                }
                .padding(.bottom)
                DiagnoseButtons(stepsList: $stepsList, index: 0)
                NavigationLink(destination: Symptoms(caseData: caseData, secondsTotal: secondsHere + secondsTotal, stepsList: $stepsList)) {
                    HStack {
                        Text("Symptoms")
                            .foregroundColor(Color.hotPink)
                        Image(systemName: "chevron.right")
                            .foregroundColor(Color.hotPink)
                    }
                    .padding(.vertical)
                }
//                .simultaneousGesture(TapGesture().onEnded {
//                    steps.stepList.append(selectedCause)
//                })
            }
        }
        .background(Color.lighterGray.ignoresSafeArea())
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
        
    }
}

struct History_Previews: PreviewProvider {
    static var previews: some View {
        History(caseData: testCaseData)
            .environmentObject(Steps())
            //.environmentObject(TimeToDiagnose())
    }
}

struct HistoryText: View {
    var caseData: CaseData
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("History")
                .font(.system(size: 35))
                .fontWeight(.semibold)
                .padding(.bottom)
            HistoryTextBody(caseData: caseData)
        }
        .padding(.horizontal, 30)
    }
}

struct HistoryTextBody: View {
    var caseData: CaseData
    
    func BuildDescriptionFromCaseData() -> String {
        var description: String = "Case ID \(caseData.caseId) is a \(caseData.age)-year-old \(caseData.gender) with a past medical history of "
        if caseData.history3 == "" {
            description += "\(caseData.history1) and \(caseData.history2)."
        } else {
            description += "\(caseData.history1), \(caseData.history2), and \(caseData.history3)."
        }
        return description + " Tobacco use is \(caseData.tobaccoUse)."
    }
    
    var body: some View {
        VStack {
            Avatar(gender: caseData.gender, age: caseData.age)
            Text(BuildDescriptionFromCaseData())
                .textStyle(WhiteCard())
        }
    }
}
