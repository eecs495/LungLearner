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
            ZStack {
                VStack {
                    Image("Logo")
                        .resizable()
                        .frame(width: 100, height: 100, alignment: .center)
                        .padding(.bottom, 30)
                    NavigationLink(
                        destination: History(caseData: caseData!)) {
                        Text("New Case")
                            .font(.system(size: 20))
                    }
                    .buttonStyle(WideButtonStyle())
                    .padding(.bottom)
                    .padding(.horizontal, 30)
                    NavigationLink(
                        destination: Progress()) {
                        Text("Review")
                            .font(.system(size: 20))
                    }
                    .buttonStyle(WideButtonStyle())
                    .padding(.horizontal, 30)
                    Spacer()
                }
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
