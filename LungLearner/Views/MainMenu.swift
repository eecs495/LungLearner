//
//  MainMenu.swift
//  LungLearner
//
//  Created by frank shen on 10/2/20.
//

import SwiftUI

struct MainMenu: View {
    @EnvironmentObject var steps: Steps
    var caseDbManager = CaseDatabaseManager()
    var caseData: CaseData?
    
    @State private var isPresented = false
    
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
        NavigationView {
            VStack {
                Text("Lung Learner")
                    .font(.largeTitle)
                    .bold()
                NavigationLink(
                    destination: History(caseData: caseData!)) {
                    Text("New Case")
                        .bold()
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding(.vertical)
                        .padding(.horizontal, 50)
                }
                .padding(.top, 30)
                NavigationLink(
                    destination: Progress()) {
                    Text("Review")
                        .bold()
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding(.vertical)
                        .padding(.horizontal, 50)
                }
                Spacer()
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

struct MainMenu_Previews: PreviewProvider {
    static var previews: some View {
        MainMenu().environmentObject(Steps())
    }
}
