//
//  MainMenu.swift
//  LungLearner
//
//  Created by frank shen on 10/2/20.
//

import SwiftUI

struct MainMenu: View {
    //@EnvironmentObject var steps: Steps
    // @StateObject var caseDbManager = CaseDatabaseManager()
    @State var caseData: CaseData? = {
        do {
            return try CaseDatabaseManager.shared.getRandomCase()
        } catch CaseError.runtimeError(let errorMessage) {
            print(errorMessage)
            return nil
        } catch {
            print("Other errors")
            return nil
        }
    }()
    
    @State private var isPresented = false

    
    init() {
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
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    }
                    .buttonStyle(WideButtonStyle())
                    .padding(.bottom)
                    .padding(.horizontal, 30)
                    NavigationLink(
                        destination: Progress()) {
                        Text("Review")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                    }
                    .buttonStyle(WideButtonStyle())
                    .padding(.horizontal, 30)
                    Spacer()
                }
            }
        }
        .background(Color.lighterGray.ignoresSafeArea())
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}

struct MainMenu_Previews: PreviewProvider {
    static var previews: some View {
        MainMenu()
            .environmentObject(Steps())
            //.environmentObject(TimeToDiagnose())
    }
}
