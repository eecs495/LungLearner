//
//  Progress.swift
//  LungLearner
//
//  Created by Joe Ginsburg on 10/19/20.
//

import SwiftUI

struct Progress: View {
    var body: some View {
        let userDbManager = UserDatabaseManager()
        let counts = userDbManager.getTotalUserProgress()
        let incomplete = counts.totalCases - counts.correctCases - counts.incorrectCases
        //overall container
        VStack {
            VStack(alignment: .leading) {
                HStack(alignment: .lastTextBaseline) {
                    Text("\(counts.correctCases)")
                        .foregroundColor(Color.green)
                        .font(.system(size: 70))
                    Text("Correct")
                }
                .padding(.vertical, -10)
                HStack(alignment: .lastTextBaseline) {
                    Text("\(counts.incorrectCases)")
                        .foregroundColor(Color.red)
                        .font(.system(size: 70))
                    Text("Incorrect")
                }
                .padding(.vertical, -10)
                HStack(alignment: .lastTextBaseline) {
                    Text("\(incomplete)")
                        .foregroundColor(Color.gray)
                        .font(.system(size: 70))
                    Text("Incomplete")
                }
                .padding(.vertical, -10)
            }
            .padding()
            //Review Panel
            NavigationLink(
                destination: ReviewList( correctCases: testCorrectCaseDataList, incorrectCases: testIncorrectCaseDataList)) {
                Text("Review Cases")
                    .bold()
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding(.horizontal, 50)
            }
            Spacer()
        }
        .navigationBarTitle("Progress")
    }
}

struct Progress_Previews: PreviewProvider {
    static var previews: some View {
        Progress()
    }
}

