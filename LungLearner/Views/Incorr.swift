//
//  Incorr.swift
//  LungLearner
//
//  Created by Drew Hirselj on 10/4/20.
//

import SwiftUI

struct DiagnoseRow: View {
    var process: Process
    
    var body: some View {
        HStack {
            Image(systemName: process.symbolName)
            Text(process.certainty + " after " + process.name)
        }
    }
}

struct ProgressCircle: View {
//    @Binding var progress: Double
    var progress: Double
    var correct: Int
    var total: Int
    
    init(correct: Int, total: Int) {
        progress = Double(Double(correct) / Double(total))
        self.correct = correct
        self.total = total
    }
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 20.0)
                .opacity(0.3)
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            Circle()
                .trim(from: 0.0, to: CGFloat(min(self.progress, 1.0)))
                .stroke(style: StrokeStyle(lineWidth: 20.0, lineCap: .round, lineJoin: .round))
                .foregroundColor(.red)
                .rotationEffect(Angle(degrees: 270.0))
                .animation(.linear)
            Text(String(format: "%.0f %%", min(self.progress, 1.0)*100.0))
                .font(.largeTitle)
                .bold()
        }
        
    }
}

struct Incorr: View {
    
    var caseData: CaseData
    @State var correct: Bool = false
    @EnvironmentObject var steps: Steps
//    var steps: Steps
    let userDbManager = UserDatabaseManager()
    @State var counts: (totalCases: Int, correctCases: Int, incorrectCases: Int) = (4,1,2)
//    @State var counts: (Int, Int, Int) = (0,0,0)
    @State var isFav: Bool = false
    
    func setup() {
//        if (self.caseData.correctDiagnosis == steps.stepList[5]) {
//            self.correct = true
//        }
    }
    
    init(caseData: CaseData) {
        self.caseData = caseData
        self.setup()
    }
    
//    init(caseData: CaseData, steps: Steps) {
//        self.caseData = caseData
//        self.steps = steps
//        if (self.caseData.correctDiagnosis == self.steps.stepList[5]) {
//            self.correct = true
//        }
//    }
    
    // create init function here, use example from MainMenu.swift
    
    var body: some View {
//            let userDbManager = UserDatabaseManager()
//            let counts = userDbManager.getTotalUserProgress()
//            let userDbManager = UserDatabaseManager()
//        self.counts = userDbManager.getTotalUserProgress()
//            counts = (totalCases: Int(4), correctCases: Int(1), incorrectCases: Int(2))
//            counts = (Int(4), Int(1), Int(2))
            
//        var progressValue: Float = 0.0
//            if (counts.totalCases != 0) {
//                self.progressValue = Float(counts.correctCases / counts.totalCases)
//            }
//            else {
//                self.progressValue = Float(0.0)
//            }
            
            
           
            VStack {
                
                HStack {
                    Text("Your answer of ")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .foregroundColor(.primary)
                    +
                    Text("\(steps.stepList[5]) ")
                        .font(.title)
                        .foregroundColor(.accentColor)
                    +
                    Text("was")
                        .font(.title)
                        .foregroundColor(.primary)
                }
                .padding(.bottom, 20)
                
                if (correct == true) {
//                    counts.correctCases = counts.correctCases + Int(1)
                    Text("Correct!")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        .padding(.top, 20)
                        .padding(.bottom)
                        .background(Rectangle().fill(Color.green).cornerRadius(20).frame(width: 150))
                        
                }
                else {
                    Text("Incorrect!")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                        .padding(.top, 20)
                        .padding(.bottom)
                        .background(Rectangle().fill(Color.red).cornerRadius(20).frame(width: 170))
                        
                        
                    Text("Actual Cause of Respiratory Failure")
                        .bold()
                        .padding(.bottom, 2)
                        .font(.system(size: 20))
                        .padding(.top, 40)
                        
                    Text("\(caseData.correctDiagnosis)")
//                        .font(.body)
                        .font(.system(size: 40))
                        .fontWeight(.heavy)
                        .foregroundColor(.accentColor)
                }
               
                
                Text("Your Diagnostic Process")
                    .bold()
                    .padding(.bottom, 10)
                    .font(.system(size: 20))
                    .padding(.top)
                VStack(alignment: .leading) {
                    if steps.stepList.count == 6 {
                        ForEach((0 ..< 5), id: \.self) {
                            Text("\(steps.stepList[$0]) after \(causeNames[$0])")
//                                .font(.body)
                                .font(.system(size: 20))
                                .foregroundColor(.secondary)
                            }
                    }
                }
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.black, lineWidth: 4)
                )
                
//                Text("\(counts.correctCases)")
//                ProgressCircle(progress: self.$progressValue)
                ProgressCircle(correct: counts.correctCases, total: counts.totalCases)
                
                Spacer()
                HStack {
                    Button(action: {
                        print("I just favorited this case!")
                        isFav = !isFav
                        counts.correctCases = counts.correctCases + Int(1)
                        
                    }) {
                        if isFav {
                            Image(systemName: "heart.fill")
                                .font(.largeTitle)
                                .foregroundColor(Color.black)
                                .padding()
                        }
                        else {
                            Image(systemName: "heart")
                                .font(.largeTitle)
                                .foregroundColor(Color.black)
                                .padding()
                        }
                        
                    }
                    Spacer()
                    NavigationLink(destination: MainMenu()) {
                        Image(systemName: "house.fill")
                            .font(.largeTitle)
                            .foregroundColor(Color.black)
                            .padding()
                    }
                    Spacer()
                    Button(action: {
                        print("I am going to the progress page")
                    }) {
                        Image(systemName: "arrow.right")
                            .font(.largeTitle)
                            .foregroundColor(Color.black)
                            .padding()
                    }
                    .simultaneousGesture(TapGesture().onEnded {
                        steps.stepList.removeAll()
                })
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
        
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
        testSteps.stepList = ["COPD", "Unsure", "CHF", "COPD", "Unsure", "COPD"]
        return Incorr(caseData: testCaseData1)
            .environmentObject(testSteps)
        //        return Incorr(caseData: testCaseData1, steps: testSteps)
//            .environmentObject(testSteps)
    }
}
