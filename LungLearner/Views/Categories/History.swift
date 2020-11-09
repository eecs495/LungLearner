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
    
    var body: some View {
            
        VStack {
            HStack {
                ProgressCircles(coloredIndex: 0)
//                HStack {
//                    Text("\((secondsHere + secondsTotal) / 60):")
//                        .padding(.trailing, -8)
//                    if (secondsHere + secondsTotal) % 60 < 10 {
//                        Text("0\((secondsHere + secondsTotal) % 60)")
//                    } else {
//                        Text("\((secondsHere + secondsTotal) % 60)")
//                    }
//                }
                DiagnoseTimer(secondsHere: secondsHere, secondsTotal: secondsTotal)
                .onReceive(timer) { _ in
                    self.secondsHere += 1
                }
            }
            HistoryText(caseData: caseData)
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
                NavigationLink(destination: Symptoms(caseData: caseData, secondsTotal: secondsHere + secondsTotal)) {
                    HStack {
                        Text("Symptoms")
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
    
    var body: some View {
        VStack {
            Avatar(gender: caseData.gender, age: caseData.age)
            Text("Your patient is a \(caseData.age) year old \(caseData.gender) with a past medical history of \(caseData.history1), \(caseData.history2), and \(caseData.history3). Tobacco use is \(caseData.tobaccoUse).")
                .textStyle(WhiteCard())
        }
    }
}
