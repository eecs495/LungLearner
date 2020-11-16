import SwiftUI

struct SpecialCase {
    var id: Int
    var caseData: CaseData
    var reason: String
    var favorite: Bool
}

struct ReviewList: View {
    let userDbManager = UserDatabaseManager()
    let caseDbManager = CaseDatabaseManager()
    var completedCases: [(id: Int64, correct: Bool)]
    //data_list is the array of all the case data
    
    @State var show_fav = false
        //this determines whether to show the favorites only
    
    //.correct will be the enum that used to decide the category of the Case,
    //in this case, the category would be correct and wrong cases
  
    var correctCases: [SpecialCase] = []
    var correctReasons: [String] = []
    var incorrectCases: [SpecialCase] = []
    var incorrectReasons: [String] = []
    
    var favoriteCases: [Int64] = []
    var favoriteCorrectCases: [CaseData] = []
    var favoriteIncorrectCases: [CaseData] = []
    
    init() {
        completedCases = userDbManager.getListOfCompletedCases()
        favoriteCases = userDbManager.getFavoriteCases()
        for completedCase in completedCases {
            do {
                if completedCase.correct {
                    var correctCase = SpecialCase(
                        id: 1,
                        caseData: try caseDbManager.getCaseById(Id: completedCase.id),
                        reason: try userDbManager.getUserCaseById(Id: completedCase.id).reason,
                        favorite: false
                    )
                    correctCase.id = correctCase.caseData.id
                    if favoriteCases.contains(Int64(correctCase.id)) {
                        correctCase.favorite = true
                    }
                    correctCases.append(correctCase)
                } else {
                    var incorrectCase = SpecialCase(
                        id: 1,
                        caseData: try caseDbManager.getCaseById(Id: completedCase.id),
                        reason: try userDbManager.getUserCaseById(Id: completedCase.id).reason,
                        favorite: false
                    )
                    incorrectCase.id = incorrectCase.caseData.id
                    if favoriteCases.contains(Int64(incorrectCase.id)) {
                        incorrectCase.favorite = true
                    }
                    incorrectCases.append(incorrectCase)
//                    let caseData = try caseDbManager.getCaseById(Id: completedCase.id)
//                    incorrectCases.append(caseData)
//                    let userCase = try userDbManager.getUserCaseById(Id: completedCase.id)
//                    incorrectReasons.append(userCase.reason)
//                    if favoriteCases.contains(userCase.caseid) {
//                        favoriteIncorrectCases.append(caseData)
//                    }
                }
            } catch CaseError.runtimeError(let errorMessage) {
                print(errorMessage)
            } catch {
                print("Other errors")
            }
        }
        
        //correctCases = testCorrectCaseDataList
        //incorrectCases = testIncorrectCaseDataList
    }
    
    var body: some View {
            //the list will be sorted by the key, which is the category
            
        ZStack {
            Color.lighterGray
            List{
                Toggle(isOn: $show_fav){
                                    Text("Show Favorites Only")
                                }
                    Section(header: Text("Correct")){
                        ForEach(self.correctCases, id: \.id) { correctCase in
                            if correctCase.favorite || !show_fav {
                                NavigationLink(
                                    destination: ReviewCase(caseData: correctCase.caseData, reason: correctCase.reason, firstDiagnosis: false, secondsTotal: 0)){
                                    ReviewListCell(caseData: correctCase.caseData, correct: true, favorite: correctCase.favorite)
                                }
                            }
                        }
                    }
                    Section(header: Text("Incorrect")){
                        ForEach(self.incorrectCases, id: \.id) { incorrectCase in
                            if incorrectCase.favorite || !show_fav {
                                NavigationLink(
                                    destination: ReviewCase(caseData: incorrectCase.caseData, reason: incorrectCase.reason, firstDiagnosis: false, secondsTotal: 0)){
                                    ReviewListCell(caseData: incorrectCase.caseData, correct: true, favorite: incorrectCase.favorite)
                                }
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
        ReviewList()
    }
}

struct ReviewListCell: View {
    var caseData: CaseData
    var correct: Bool
    var favorite: Bool
    private var diagnosisColor: Color
    
    init(caseData: CaseData, correct: Bool, favorite: Bool) {
        self.caseData = caseData
        self.correct = correct
        self.favorite = favorite
        
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
                    Text("Case \(caseData.caseId)")
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
            Spacer()
            if favorite {
                HStack {
                    Image(systemName: "heart.fill")
                        .font(.system(size: 20))
                        .foregroundColor(.yellow)
                        .padding(.trailing, 5)
                }
            }
        }
    }
}
