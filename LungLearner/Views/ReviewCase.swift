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
    
    var body: some View {
        ScrollView {
            ZStack {
                VStack(alignment: .center) {
                    Text("Review")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        .padding(.top, 30)
                        .padding(.bottom)
                    Group {
                        ReviewButton(showCategory: $showHistory, blurBackground: $blurBackground, title: "History")
                        ReviewButton(showCategory: $showSymptoms, blurBackground: $blurBackground, title: "Symptoms")
                        ReviewButton(showCategory: $showPhysicalExam, blurBackground: $blurBackground, title: "PhysicalExam")
                        ReviewButton(showCategory: $showLabValues, blurBackground: $blurBackground, title: "Lab Values")
                        ReviewButton(showCategory: $showXRay, blurBackground: $blurBackground, title: "X-Ray")
                    }
                    NavigationLink(destination: DiagnoseCase(caseData: caseData)) {
                        Image(systemName: "arrow.right")
                            .font(.largeTitle)
                            .foregroundColor(Color.black)
                            .padding()
                            .padding(.vertical)
                    }
                    

                }
                .blur(radius: self.blurBackground ? 5 : 0)
                if self.showHistory {
                    ZStack {
                        Color.white
                        VStack {
                            ScrollView {
                                HistoryText(caseData: caseData)
                                    .padding(.horizontal)
                            }
                            Spacer()
                            ClosePopUpButton(showCategory: $showHistory, blurBackground: $blurBackground)
                        }
                        .padding()
                    }
                    .frame(width: 300, height: 400)
                    .cornerRadius(20).shadow(radius: 20)
                }
                
                if self.showSymptoms {
                    ZStack {
                        Color.white
                        VStack {
                            ScrollView {
                                SymptomsText(caseData: caseData)
                                    .padding(.horizontal)
                            }
                            Spacer()
                            ClosePopUpButton(showCategory: $showSymptoms, blurBackground: $blurBackground)
                        }
                        .padding()
                    }
                    .frame(width: 300, height: 400)
                    .cornerRadius(20).shadow(radius: 20)
                }
                
                if self.showPhysicalExam {
                    ZStack {
                        Color.white
                        VStack {
                            ScrollView {
                                PhysicalExamText(caseData: caseData)
                                    .padding(.horizontal)
                            }
                            Spacer()
                            ClosePopUpButton(showCategory: $showPhysicalExam, blurBackground: $blurBackground)
                        }
                        .padding()
                    }
                    .frame(width: 300, height: 400)
                    .cornerRadius(20).shadow(radius: 20)
                }
                
                if self.showLabValues {
                    ZStack {
                        Color.white
                        VStack {
                            ScrollView {
                                LabValuesText(caseData: caseData)
                                    .padding(.horizontal)
                            }
                            Spacer()
                            ClosePopUpButton(showCategory: $showLabValues, blurBackground: $blurBackground)
                        }
                        .padding()
                    }
                    .frame(width: 300, height: 400)
                    .cornerRadius(20).shadow(radius: 20)
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
                    .frame(width: 300, height: 300)
                    .cornerRadius(20).shadow(radius: 20)
                }
                
                
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

struct ReviewCase_Previews: PreviewProvider {
    static var previews: some View {
        ReviewCase(caseData: testCaseData).environmentObject(Steps())
    }
}
