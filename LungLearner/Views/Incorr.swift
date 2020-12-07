//
//  Incorr.swift
//  LungLearner
//
//  Created by Drew Hirselj on 10/4/20.
//

import SwiftUI
import GoogleSignIn


struct DiagnoseRow: View {
    var process: Process
    
    var body: some View {
        HStack {
            Image(systemName: process.symbolName)
            Text(process.certainty + " after " + process.name)
        }
    }
}

struct AccuracyCircle: View {
//    @Binding var progress: Double
    var progress: Double
    var correct: Int
    var total: Int
    
    init(correct: Int, total: Int) {
        if (total == 0) {
            self.total = 1
        }
        else {
            self.total = total
        }
        self.correct = correct
        self.progress = Double(Double(self.correct) / Double(self.total))
        
    }
    
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .stroke(lineWidth: 20.0)
                    .opacity(0.3)
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    .frame(width: 120, height: 120)
                Circle()
                    .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                    .stroke(style: StrokeStyle(lineWidth: 20.0, lineCap: .round, lineJoin: .round))
                    .foregroundColor(.green)
                    .rotationEffect(Angle(degrees: 270.0))
                    .animation(.linear)
                    .frame(width: 120, height: 120)
                Text(String(format: "%.0f %%", min(self.progress, 1.0)*100.0))
                    .font(.title2)
                    .bold()
            }
            .padding(.top, 20)
            .padding(.bottom, 10)

            Text("Overall Accuracy")
                .font(.title3)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
        }
//        .offset(x: 25)
        
    }
}

struct PerfectStreak: View {
    
    var correct: Bool = false
    var perfectStreak = UserDatabaseManager.shared.getCorrectScoreStreak()
    
    init(correct: Bool) {
        self.correct = correct
    }
    
    var body: some View {
        VStack {
            if (self.correct) {
                Text(String(perfectStreak + 1))
                    .font(.system(size: 100))
            }
            else {
                Text("0")
                    .font(.system(size: 100))
            }
            Text("Perfect Streak")
                .font(.title3)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                .offset(y: 20)
//                .padding(.top, 30)
        }
        .offset(x: 40)
    }
}

struct Incorr: View {
    var caseData: CaseData
    var reason: String
    @State var isFav: Bool = false
    var stepsList: [String]
    var receivedHint: Bool
    let secondsTotal: Int
    var my_email = URL(string: "mailto:pnymm22@gmail.com")

    init(caseData: CaseData, reason: String, stepsList: [String], receivedHint: Bool, secondsTotal: Int) {
        self.caseData = caseData
        self.reason = reason
        self.stepsList = stepsList
        self.receivedHint = receivedHint
        self.secondsTotal = secondsTotal
    }
    
    var body: some View {
        let counts = UserDatabaseManager.shared.getTotalUserProgress()
        let pointManager = UserPointsManager()
        let email = "pnymm22@gmail.com"//"+"?body="+self.reason
        let url = URL(string: "mailto:\(email)")
       
        ZStack(alignment: .bottom) {
            ScrollView {
                VStack {

                    Text("Your answer of ")
                        .font(.title)
                        .foregroundColor(.primary)
                    +
                    Text("\(stepsList[5]) ")
                        .font(.title)
                        .foregroundColor(.accentColor)

                    Text("was")
                        .font(.title)
                        .foregroundColor(.primary)
                    
                    
                    if (self.caseData.correctDiagnosis == self.stepsList[5]) {
                        Text("Correct!")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                            .padding(.top, 15)
                            .padding(.bottom, 15)
                            .background(Rectangle().fill(Color.green).cornerRadius(20).frame(width: 150))
                            
                    }
                    else {
                        Text("Incorrect!")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.primary)
                            .padding(.top, 15)
                            .padding(.bottom, 15)
                            .background(Rectangle().fill(Color.red).cornerRadius(20).frame(width: 170))
                            
                        Text("Actual Cause of Respiratory Failure")
                            .bold()
                            .padding(.bottom, 2)
                            .font(.system(size: 20))
                            .padding(.top, 20)
                            
                        Text("\(caseData.correctDiagnosis)")
        //                        .font(.body)
                            .font(.system(size: 40))
                            .fontWeight(.heavy)
                            .foregroundColor(.accentColor)
                        
        //                Link("Send Email to Professor", destination: URL(string: url)!)
                        Button(action: {
                            if #available(iOS 10.0, *) {
                                UIApplication.shared.open(self.my_email!, options: [:], completionHandler: nil)
                            } else {
                                UIApplication.shared.openURL(self.my_email!)
                            }
                        }) {
                            VStack {
                                Text("Need help? Click here ")
                                    .font(.system(size: 25))
                                    .foregroundColor(Color.black)
                                Text("to email the medical staff")
                                    .font(.system(size: 25))
                                    .foregroundColor(Color.black)
                            }
                            .padding()
                            }
                        .background(RoundedRectangle(cornerRadius: 20).fill(Color.gray))
                        .frame(width: 500, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        
                    }
                    
                    HStack{
                        // if the user got the answer right, +200 points
                        if (self.caseData.correctDiagnosis == self.stepsList[5]) {
                            // if the user used a hint -100
                            if (self.receivedHint == true) {
                                Text("Points awarded: 400")
                                    .font(.title)
                            }
                            else {
                                Text("Points awarded: 500")
                                    .font(.title)
                            }
                        }
                        // else they get 0 points
                        else {
                            Text("Points awarded: 0")
                                .font(.title)
                        }
                    }
                    .padding(.top, 20)
                    .padding(.bottom, 10)
                    
                    HStack {
                        if (self.caseData.correctDiagnosis == stepsList[5]) {
                            AccuracyCircle(correct: counts.correctCases + 1, total: counts.totalCases + 1)
                                .offset(x: 30)
                            Spacer()
                            PerfectStreak(correct: true)
                                .offset(x: -30)
                        }
                        else {
                            AccuracyCircle(correct: counts.correctCases, total: counts.totalCases + 1)
                                .offset(x: 60)
                            Spacer()
                            PerfectStreak(correct: false)
                                .offset(x: -30)
                        }
                        Spacer()
                    }
                    .padding()
                    
                    Text("Your Diagnostic Process")
                        .bold()
                        .padding(.bottom, 10)
                        .font(.system(size: 25))
                        .padding(.top)
                    VStack(alignment: .leading) {
                        ForEach((0 ..< 5), id: \.self) {
                            Text("\(stepsList[$0]) ")
                                .font(.system(size: 20))
                                .foregroundColor(.accentColor)
                            +
                            Text("after \(causeNames[$0])")
                                .font(.system(size: 20))
                                .foregroundColor(.secondary)
                            }
                    }
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.black, lineWidth: 4)
                    )
                    
                    HStack {
                        Spacer()
                        VStack {
                            Button(action: {
                                print("I just favorited this case!")
                                isFav = !isFav
                            }) {
                                if isFav {
                                    Image(systemName: "heart.fill")
                                        .font(.largeTitle)
                                        .foregroundColor(Color.black)
                                        
                                }
                                else {
                                    Image(systemName: "heart")
                                        .font(.largeTitle)
                                        .foregroundColor(Color.black)
                                        
                                }
                            }
                            Text("Favorite")
                                .fontWeight(.bold)
                                .padding(.top, 5)
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
                        .simultaneousGesture(TapGesture().onEnded {
                            // if the user was right
                            if (self.caseData.correctDiagnosis == stepsList[5]) {
                                let myUser = UserCaseResult(caseid: Int64(self.caseData.id), diagnoses: stepsList, reason: self.reason, correct: true)
                                UserDatabaseManager.shared.storeCaseResult(result: myUser)
                                UserDatabaseManager.shared.updateCorrectScoreStreak(correct: true)
                                if (self.receivedHint == true) {
                                    pointManager.addUserPointsForUsername(username: GIDSignIn.sharedInstance().currentUser!.profile.name, points: max(0, 400))
                                }
                                else {
                                    pointManager.addUserPointsForUsername(username: GIDSignIn.sharedInstance().currentUser!.profile.name, points: max(0, 500))
                                }
                            }
                            // else if the user was wrong
                            else {
                                let myUser = UserCaseResult(caseid: Int64(self.caseData.id), diagnoses: stepsList, reason: self.reason, correct: false)
                                UserDatabaseManager.shared.storeCaseResult(result: myUser)
                                UserDatabaseManager.shared.updateCorrectScoreStreak(correct: false)
                                pointManager.addUserPointsForUsername(username: GIDSignIn.sharedInstance().currentUser!.profile.name, points: 0)
                                
                            }
                            UserDatabaseManager.shared.setCaseFavorite(idInput: Int64(self.caseData.id), favoriteInput: isFav)
                        })
                        Spacer()
                    }
                    .offset(y: 20)
                    .padding(.top, 30)
                }
                .navigationBarBackButtonHidden(true)
                .navigationBarHidden(true)
            }
        }
    
    }
}


// Consider updating the caseData to include <favorited>

struct IncorrText: View {
    var caseData: CaseData
    var correct: Bool
    
    var body: some View {
            VStack(alignment: .leading) {
                Text(correct ? "Correct" : "Incorrect!")
                    .font(.system(size: 35))
                    .fontWeight(.semibold)
                    .padding(.bottom, 5)
            }
            .padding(.horizontal, 30)
    }
}

struct Incorr_Previews: PreviewProvider {
    static var previews: some View {
        let testSteps = Steps()
        testSteps.stepList = ["COPD", "Unsure", "CHF", "COPD", "Unsure", "Heart Failure"]
        return Incorr(caseData: testCaseData1, reason: "Something", stepsList: testSteps.stepList, receivedHint: true, secondsTotal: 200)
    }
}
