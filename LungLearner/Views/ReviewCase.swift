//
//  ReviewCase.swift
//  LungLearner
//
//  Created by Audrey Ladd on 10/9/20.
//

import SwiftUI

let causeNames: [String] = ["History", "Symptoms", "Physical Exam", "Lab Values", "X-Ray"]

struct ReviewCase: View {
    @EnvironmentObject var steps: Steps
    @State private var selectedCause = 0
    
    @State var blurBackground: Bool = false
    @State var showHistory: Bool = false
    @State var showSymptoms: Bool = false
    @State var showPhysicalExam: Bool = false
    @State var showLabValues: Bool = false
    @State var showXRay: Bool = false
    
    var caseData: CaseData
    var firstDiagnosis: Bool = true
    
    var body: some View {
            ZStack {
                VStack(alignment: .center) {
                        if firstDiagnosis {
                            VStack(alignment: .leading) {
                                Text("Review")
                                    .font(.system(size: 35))
                                    .fontWeight(.semibold)
                                    .padding(.bottom, 5)
                                Text("Review your patient's case data by selecting the categories below.")
                                    .padding(.bottom, 5)
                                }
                            .padding(.horizontal, 30)
                        }
                        Group {
                            ReviewButton(showCategory: $showHistory, blurBackground: $blurBackground, title: "History")
                            ReviewButton(showCategory: $showSymptoms, blurBackground: $blurBackground, title: "Symptoms")
                            ReviewButton(showCategory: $showPhysicalExam, blurBackground: $blurBackground, title: "Physical Exam")
                            ReviewButton(showCategory: $showLabValues, blurBackground: $blurBackground, title: "Lab Values")
                                ReviewButton(showCategory: $showXRay, blurBackground: $blurBackground, title: "X-Ray")
                        }
                        .padding(.bottom, 5)
                        .padding(.horizontal, 25)
                    
                    .padding(.top, 10)
                    if firstDiagnosis {
                        Spacer()
                        NavigationLink(destination: DiagnoseCase(caseData: caseData)) {
                            HStack {
                                Text("Diagnose Case")
                                    .foregroundColor(Color.hotPink)
                                Image(systemName: "chevron.right")
                                    .foregroundColor(Color.hotPink)
                            }
                            .padding(.vertical)
                        }
                    }
                    if !firstDiagnosis {
                        Text("Correct Diagnosis")
                            .bold()
                            .padding(.bottom, 2)
                            .padding(.top)
                        Text("\(caseData.correctDiagnosis)")
                            .font(.body)
                            .foregroundColor(.accentColor)
                    }
                }
                .blur(radius: self.blurBackground ? 5 : 0)
                if self.showHistory {
                    ZStack {
                        Color.white
                        VStack {
                            ScrollView {
                                VStack(alignment: .leading) {
                                    HistoryTextBody(caseData: caseData)
                                }
                                .padding()
                            }
                            Spacer()
                            ClosePopUpButton(showCategory: $showHistory, blurBackground: $blurBackground)
                        }
                        .padding()
                    }
                    .frame(height: 500)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .cornerRadius(20).shadow(radius: 20)
                    .padding(.horizontal)
                }
                
                if self.showSymptoms {
                    ZStack {
                        Color.white
                        VStack {
                            ScrollView {
                                VStack(alignment: .leading) {
                                    SymptomsTextBody(caseData: caseData)
                                }
                                .padding()
                            }
                            Spacer()
                            ClosePopUpButton(showCategory: $showSymptoms, blurBackground: $blurBackground)
                        }
                        .padding()
                    }
                    .frame(height: 500)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .cornerRadius(20).shadow(radius: 20)
                    .padding(.horizontal)
                }
                
                if self.showPhysicalExam {
                    ZStack {
                        Color.white
                        VStack {
                            ScrollView {
                                VStack(alignment: .leading) {
                                    PhysicalExamTextBody(caseData: caseData)
                                }
                                .padding()
                            }
                            Spacer()
                            ClosePopUpButton(showCategory: $showPhysicalExam, blurBackground: $blurBackground)
                        }
                        .padding()
                    }
                    .frame(height: 500)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .cornerRadius(20).shadow(radius: 20)
                    .padding(.horizontal)
                }
                
                if self.showLabValues {
                    ZStack {
                        Color.white
                        VStack {
                            ScrollView {
                                HStack {
                                    VStack(alignment: .leading) {
                                        LabValuesTextBody(caseData: caseData)
                                    }
                                    .padding()
                                    Spacer()
                                }
                            }

                            Spacer()
                            ClosePopUpButton(showCategory: $showLabValues, blurBackground: $blurBackground)
                        }
                        .padding()
                    }
                    .frame(height: 500)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .cornerRadius(20).shadow(radius: 20)
                    .padding(.horizontal)
                }
                
                if self.showXRay {
                    ZStack {
                        Color.white
                        VStack {
                            Image(caseData.xRayName)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(10)
                            Spacer()
                            ClosePopUpButton(showCategory: $showXRay, blurBackground: $blurBackground)
                        }
                        .padding()
                    }
                    .frame(height: 375)
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .cornerRadius(20).shadow(radius: 20)
                    .padding(.horizontal)
                }
                
                
            }
        .navigationBarTitle("Case \(caseData.id)")
        .navigationBarBackButtonHidden(firstDiagnosis)
        .navigationBarHidden(firstDiagnosis)
    }
}

struct ReviewCase_Previews: PreviewProvider {
    static var previews: some View {
        ReviewCase(caseData: testCaseData1, firstDiagnosis: true).environmentObject(Steps())
    }
}
