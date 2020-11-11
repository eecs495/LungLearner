import SwiftUI

struct ReviewList: View {
    //data_list is the array of all the case data
    
    //.correct will be the enum that used to decide the category of the Case,
    //in this case, the category would be correct and wrong cases
  
    var correctCases: [CaseData]
    var incorrectCases: [CaseData]
    
    var body: some View {
            //the list will be sorted by the key, which is the category
            
        ZStack {
            Color.lighterGray
            List{
                    Section(header: Text("Correct")){
                        ForEach(self.correctCases, id: \.id) { caseData in
                            NavigationLink(
                                destination: ReviewCase(caseData: caseData, firstDiagnosis: false, secondsTotal: 0)){
                                ReviewListCell(caseData: caseData, correct: true)
                            }
                        }
                    }
                    Section(header: Text("Incorrect")){
                        ForEach(self.incorrectCases, id: \.id) { caseData in
                            NavigationLink(
                                destination: ReviewCase(caseData: caseData, firstDiagnosis: false, secondsTotal: 0)){
                                ReviewListCell(caseData: caseData, correct: false)
                            }
                        }
                    }
                }
            .navigationBarTitle("Review Cases")
        }
    }
}

struct ReviewList_Previews: PreviewProvider {
    static var previews: some View {
        ReviewList(correctCases: testCorrectCaseDataList, incorrectCases: testIncorrectCaseDataList)
    }
}

struct ReviewListCell: View {
    var caseData: CaseData
    var correct: Bool
    private var diagnosisColor: Color
    
    init(caseData: CaseData, correct: Bool) {
        self.caseData = caseData
        self.correct = correct
        
        if caseData.correctDiagnosis == "COPD" {
            self.diagnosisColor = Color.blue
        } else if caseData.correctDiagnosis == "Heart failure" {
            self.diagnosisColor = Color.orange
        } else {
            self.diagnosisColor = Color.purple
        }
    }
    
    var body: some View {
        
        HStack {
            VStack(alignment: .leading) {
                HStack {
                    Text("Case \(caseData.id)")
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                    if correct {
                        Image(systemName: "checkmark")
                            .font(.headline)
                            .foregroundColor(.green)
                            .padding(.trailing, 5)
                    } else {
                        Image(systemName: "xmark")
                            .font(.headline)
                            .foregroundColor(.red)
                            .padding(.trailing, 5)
                    }
                }
                Text("\(caseData.correctDiagnosis)")
                    .font(.system(size: 12))
                    .fontWeight(.semibold)
                    .foregroundColor(diagnosisColor)
                    .padding(.bottom, 1)
                Text("Difficulty")
                    .foregroundColor(Color.gray)
                    .italic()
                Text(caseData.difficulty)
                    .foregroundColor(Color.hotPink)
                    .font(.system(size: 12))
                    .fontWeight(.semibold)
            }
            HStack {
                Avatar(gender: caseData.gender, age: caseData.age, small: true)
                
            }
        }
    }
}
