//
//  MainMenu.swift
//  LungLearner
//
//  Created by frank shen on 10/2/20.
//

import SwiftUI

struct MainMenu: View {
    var caseDbManager = CaseDatabaseManager()
    var caseData: CaseData?
    
    init() {
        do {
            self.caseData = try caseDbManager.getCaseById(Id: 1)
        } catch CaseError.runtimeError(let errorMessage) {
            print(errorMessage)
        } catch {
            print("Other errors")
        }
    }
    
    var body: some View {
        //VStack(alignment: .leading){
            
            NavigationView {
                VStack {
                    Text("Lung Learner")
                        .font(.largeTitle)
                        .bold()
                        // .multilineTextAlignment(.leading)
                    // Spacer()
                    NavigationLink(
                        destination: History(caseData: caseData!)) {
                        Text("NEW CASE")
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.black)
                            .padding()
                            .background(Color(UIColor.systemGray5))
                            .cornerRadius(10)
                            .padding(.vertical)
                            .padding(.horizontal, 50)
                            
                        // HomeItem(pic_name: "newCase",title: "New Cases")
                    }
                    .padding(.top, 30)
                    // Spacer()
                    NavigationLink(
                        destination: ReviewList(correctCases: testCorrectCaseDataList, incorrectCases: testIncorrectCaseDataList)) {
                        Text("REVIEW CASES")
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.black)
                            .padding()
                            .background(Color(UIColor.systemGray5))
                            .cornerRadius(10)
                            .padding(.vertical)
                            .padding(.horizontal, 50)
                    // HomeItem(pic_name: "pastCase",title: "Past Cases")
                    }
                    Spacer()
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
        //}
    }
}

struct MainMenu_Previews: PreviewProvider {
    static var previews: some View {
        MainMenu().environmentObject(Steps())
    }
}
