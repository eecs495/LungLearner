//
//  ReviewCase.swift
//  LungLearner
//
//  Created by Audrey Ladd on 10/9/20.
//

import SwiftUI

let causeNames: [String] = ["History", "Symptoms", "Physical Exam", "Lab Values", "X-Ray"]

struct ReviewCase: View {
    var caseData: CaseData
    var reason: String = ""
    var firstDiagnosis: Bool = true
    @Binding var stepsList: [String]

    @State var blurBackground: Bool = false
    @State var showHistory: Bool = false
    @State var showSymptoms: Bool = false
    @State var showPhysicalExam: Bool = false
    @State var showLabValues: Bool = false
    @State var showXRay: Bool = false

    @State var secondsHere: Int = 0
    var secondsTotal: Int
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State var isFav: Bool = false

    var body: some View {
        ScrollView {
            ZStack {
                    VStack(alignment: .center) {
                            if firstDiagnosis {
                                HStack {
                                    Text("Review")
                                        .font(.system(size: 35))
                                        .fontWeight(.semibold)
                                        .padding(.bottom, 5)
                                        .padding(.top)
                                    Spacer()
                                    DiagnoseTimer(secondsHere: secondsHere, secondsTotal: secondsTotal)
                                    .onReceive(timer) { _ in
                                        self.secondsHere += 1
                                    }
                                }
                                .padding(.horizontal, 30)
                            }
                            if !firstDiagnosis {
                                VStack {
                                    HStack {
                                        DataBlock(title: "Correct Diagnosis", description: caseData.correctDiagnosis)
                                            .padding(.bottom, 5)
                                            .padding(.leading, 30)
                                            .padding(.trailing)
                                        Button(action: {
                                            print("I just favorited this case!")
                                            isFav = !isFav
                                            UserDatabaseManager.shared.setCaseFavorite(idInput: Int64(self.caseData.id), favoriteInput: isFav)
                                        }) {
                                            if isFav {
                                                Image(systemName: "heart.fill")
                                                    .font(.system(size: 50))
                                                    .foregroundColor(.yellow)
                                                    
                                            }
                                            else {
                                                Image(systemName: "heart")
                                                    .font(.system(size: 50))
                                                    .foregroundColor(.yellow)
                                                    
                                            }
                                        }
                                        .padding(.trailing, 30)
                                        .onAppear {
                                            do {
                                                isFav = try UserDatabaseManager.shared.checkCaseFavorite(idInput: Int64(caseData.id))
                                            } catch CaseError.runtimeError(let errorMessage) {
                                                print(errorMessage)
                                            } catch {
                                                print("Other errors")
                                            }
                                        }
                                    }
                                }
                            }
                            Group {
                                ReviewButton(showCategory: $showHistory, blurBackground: $blurBackground, title: "History")
                                ReviewButton(showCategory: $showSymptoms, blurBackground: $blurBackground, title: "Symptoms")
                                ReviewButton(showCategory: $showPhysicalExam, blurBackground: $blurBackground, title: "Physical Exam")
                                ReviewButton(showCategory: $showLabValues, blurBackground: $blurBackground, title: "Lab Values")
                                    ReviewButton(showCategory: $showXRay, blurBackground: $blurBackground, title: "X-Ray")
                            }
                            .padding(.bottom, 5)
                            .padding(.horizontal, 30)

                        .padding(.top, 10)
                        if firstDiagnosis {
                            Spacer()
                            NavigationLink(destination: DiagnoseCase(caseData: caseData, secondsTotal: secondsTotal + secondsHere, stepsList: $stepsList)) {
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
                            DataBlock(title: "Your Notes", description: reason)
                                .padding(.vertical)
                                .padding(.horizontal, 30)
                            Spacer()
                        }
                    }
                    .blur(radius: self.blurBackground ? 5 : 0)
                    if self.showHistory {
                        ZStack {
                            Color.lighterGray
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
                        .frame(height: 375)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .cornerRadius(20).shadow(radius: 20)
                        .padding(.horizontal)
                    }

                    if self.showSymptoms {
                        ZStack {
                            Color.lighterGray
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
                            Color.lighterGray
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
                            Color.lighterGray
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
                            Color.lighterGray
                            VStack {
                                AsyncImage(url: URL(string: "https://lungxrays.s3.amazonaws.com/\(caseData.caseId).jpg")!)
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
            .background(Color.lighterGray.ignoresSafeArea())
            .navigationBarTitle("Case \(caseData.caseId)")
            .navigationBarBackButtonHidden(firstDiagnosis)
            .navigationBarHidden(firstDiagnosis)
        }
    }
}

struct ReviewCase_Previews: PreviewProvider {
    static var previews: some View {
        ReviewCase(caseData: testCaseData1, firstDiagnosis: false, stepsList: .constant(testStepsList), secondsTotal: 100)
    }
}
