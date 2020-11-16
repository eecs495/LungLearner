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
        //hardcoded for beta release, will be connected for omega
        let streak = 3
        let incomplete = counts.totalCases - counts.correctCases - counts.incorrectCases
        let pctCor = Float(counts.correctCases)/Float(counts.totalCases)
        let pctInc = Float(counts.incorrectCases)/Float(counts.totalCases)
        
        //hardcoded values just in case for demo
//        let pctCor = 0.25
//        let pctInc = 0.5
            
        
        //overall container
        VStack {
            Spacer()
            ZStack {
                Circle()
                    .stroke(lineWidth: 20.0)
                    .opacity(0.3)
                    .foregroundColor(Color.gray)
                    .frame(width: 250, height: 250)
                Circle()
                    .trim(from: 0.0, to: CGFloat(min(pctCor, 1.0)))
                    .stroke(style: StrokeStyle(lineWidth: 20.0, lineCap: .round, lineJoin: .round))
                    .foregroundColor(Color.green)
                    .rotationEffect(Angle(degrees: 270.0))
                    .animation(.linear)
                    .frame(width: 250, height: 250)
                Circle()
                    .trim(from: CGFloat(min(pctCor, 1.0)), to: CGFloat(min(pctCor + pctInc, 1.0)))
                    .stroke(style: StrokeStyle(lineWidth: 20.0, lineCap: .round, lineJoin: .round))
                    .foregroundColor(Color.red)
                    .rotationEffect(Angle(degrees: 270.0))
                    .animation(.linear)
                    .frame(width: 250, height: 250)
                //case values
                VStack(alignment: .leading) {
                    HStack(alignment: .lastTextBaseline) {
                        Text("\(counts.correctCases)")
                            .foregroundColor(Color.green)
                            .font(.system(size: 50))
                        Text("Correct")
                    }
                    .padding(.vertical, -10)
                    HStack(alignment: .lastTextBaseline) {
                        Text("\(counts.incorrectCases)")
                            .foregroundColor(Color.red)
                            .font(.system(size: 50))
                        Text("Incorrect")
                    }
                    .padding(.vertical, -10)
                    HStack(alignment: .lastTextBaseline) {
                        Text("\(incomplete)")
                            .foregroundColor(Color.gray)
                            .font(.system(size: 50))
                        Text("Incomplete")
                    }
                    .padding(.vertical, -10)
                }
            }
            .padding(.top, 20)
            .padding(.bottom, 10)
            
            Spacer()
            VStack(alignment: .leading) {
                HStack(alignment: .lastTextBaseline) {
                    Text("\(streak)")
                        .foregroundColor(Color.blue)
                        .font(.system(size: 35))
                    Text("Consecutive Days Played!")
                        .foregroundColor(Color.blue)
                }
                .padding(.vertical, 10)
                HStack(alignment: .lastTextBaseline) {
                    Text("\(counts.correctCases + counts.incorrectCases)/\(counts.totalCases)")
                        .foregroundColor(Color.blue)
                        .font(.system(size: 35))
                    Text("Cases Attempted!")
                        .foregroundColor(Color.blue)
                }
            }
            .padding()
            Spacer()
            
            //Review Panel
            Spacer()
            NavigationLink(
                destination: ReviewList()) {
                Text("Review Attempted Cases")
                    .bold()
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.hotPink)
                    .cornerRadius(10)
                    .padding(.horizontal, 50)
            }
            Spacer()
            VStack {
                NavigationLink(destination: MainMenu()) {
                    Image(systemName: "house.fill")
                        .font(.largeTitle)
                        .foregroundColor(Color.black)
                }
                Text("Home")
                    .fontWeight(.bold)
                    .padding(.top, 5)
            }
        }
        .navigationBarTitle("Progress")
    }
}

struct Progress_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Progress()
        }
    }
}

