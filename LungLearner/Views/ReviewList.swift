import SwiftUI

struct ReviewList: View {
    let userDbManager = UserDatabaseManager()
    let caseDbManager = CaseDatabaseManager()
    var completedCases: [(id: Int64, correct: Bool)]
    //data_list is the array of all the case data
    
    @State var show_fav = false
        //this determines whether to show the favorites only
    
    //.correct will be the enum that used to decide the category of the Case,
    //in this case, the category would be correct and wrong cases
  
    var correctCases: [CaseData] = []
    var correctReasons: [String] = []
    var incorrectCases: [CaseData] = []
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
                    let caseData = try caseDbManager.getCaseById(Id: completedCase.id)
                    correctCases.append(caseData)
                    let userCase = try userDbManager.getUserCaseById(Id: completedCase.id)
                    correctReasons.append(userCase.reason)
                    if favoriteCases.contains(userCase.caseid) {
                        favoriteCorrectCases.append(caseData)
                    }
                } else {
                    let caseData = try caseDbManager.getCaseById(Id: completedCase.id)
                    incorrectCases.append(caseData)
                    let userCase = try userDbManager.getUserCaseById(Id: completedCase.id)
                    incorrectReasons.append(userCase.reason)
                    if favoriteCases.contains(userCase.caseid) {
                        favoriteIncorrectCases.append(caseData)
                    }
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
//                Toggle(isOn: $show_fav){
//                                    Text("Show Favorites Only")
//                                }
                    Section(header: Text("Correct")){
                        if show_fav {
                            ForEach(0 ..< favoriteCorrectCases.count) { i in
                                NavigationLink(
                                    destination: ReviewCase(caseData: favoriteCorrectCases[i], reason: "These are my notes!", firstDiagnosis: false, secondsTotal: 0)){
                                    ReviewListCell(caseData: favoriteCorrectCases[i], correct: true, favorite: true)
                                }
                            }
                        } else {
                            ForEach(0 ..< correctCases.count) { i in
                                NavigationLink(
                                    destination: ReviewCase(caseData: correctCases[i], reason: correctReasons[i], firstDiagnosis: false, secondsTotal: 0)){
                                    ReviewListCell(caseData: correctCases[i], correct: true, favorite: favoriteCases.contains(Int64(correctCases[i].caseId)))
                                }
                            }
                        }
                    }
                    Section(header: Text("Incorrect")){
                        if show_fav {
                            ForEach(0 ..< favoriteIncorrectCases.count) { i in
                                NavigationLink(
                                    destination: ReviewCase(caseData: incorrectCases[i], reason: incorrectReasons[i], firstDiagnosis: false, secondsTotal: 0)){
                                    ReviewListCell(caseData: incorrectCases[i], correct: false, favorite: true)
                                }
                            }
                        }
                        ForEach(0 ..< incorrectCases.count) { i in
                            NavigationLink(
                                destination: ReviewCase(caseData: incorrectCases[i], reason: incorrectReasons[i], firstDiagnosis: false, secondsTotal: 0)){
                                ReviewListCell(caseData: incorrectCases[i], correct: true, favorite: favoriteCases.contains(Int64(incorrectCases[i].caseId)))
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
                        .foregroundColor(.yellow)
                        .padding(.trailing, 5)
                }
            }
        }
    }
}
