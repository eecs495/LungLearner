import SwiftUI

struct SpecialCase: Identifiable {
    var id: Int
    var caseData: CaseData
    var reason: String
    var favorite: Bool
    var correct: Bool
}

struct ReviewList: View {
//    @State var completedCases: [(id: Int64, correct: Bool)] = []
//    @State var correctCases: [SpecialCase] = []
//    @State var incorrectCases: [SpecialCase] = []
    
    @State var completedCaseIds: [(id: Int64, correct: Bool)] = []
    @State var completedCases: [SpecialCase] = []

    @State var show_fav = false

//    @State var isEditing = false
//    @State var selection: Set<Int64> = Set()
    
    @State private var editMode = EditMode.inactive
    
    func updateCases() {
        completedCaseIds = UserDatabaseManager.shared.getListOfCompletedCases()
        completedCases.removeAll()
        for completedCaseId in completedCaseIds {
            do {
                let caseData: CaseData = try CaseDatabaseManager.shared.getCaseById(Id: completedCaseId.id)
                let specialCase = SpecialCase(
                    id: caseData.id,
                    caseData:caseData,
                    reason: try UserDatabaseManager.shared.getUserCaseById(Id: completedCaseId.id).reason,
                    favorite: try UserDatabaseManager.shared.checkCaseFavorite(idInput: completedCaseId.id),
                    correct: completedCaseId.correct
                )
                completedCases.append(specialCase)
            } catch CaseError.runtimeError(let errorMessage) {
                print(errorMessage)
            } catch {
                print("Other errors")
            }
        }
    }

    var body: some View {
        //the list will be sorted by the key, which is the category

        ZStack {
            
            Color.lighterGray
            VStack {
                
                Toggle(isOn: $show_fav){
                    Text("Show Favorites Only")
                        .fontWeight(.semibold)
                }
                .padding()

                List {
                    ForEach(self.completedCases, id: \.id) { completedCase in
                        if completedCase.favorite || !show_fav {
                            NavigationLink(
                                destination: ReviewCase(caseData: completedCase.caseData, reason: completedCase.reason, firstDiagnosis: false, receivedHint: false, stepsList: .constant([]), secondsTotal: 0)){
                                ReviewListCell(caseData: completedCase.caseData, correct: completedCase.correct, favorite: completedCase.favorite)
                            }
                        }
                    }
                    .onMove(perform: moveCase)
                }
                
                
            }

        }
        .navigationBarTitle("Review Cases")
        //.navigationBarItems(trailing: editButton)
        //.environment(\.editMode, $editMode)
        .onAppear {
            updateCases()
        }
        
    }
    
    private func moveCase(source: IndexSet, destination: Int) {
            completedCases.move(fromOffsets: source, toOffset: destination)
    }
    
    private var editButton: some View {
        if editMode == .inactive {
            return Button(action: {
                self.editMode = .active
            }) {
                Text("Move Cases")
            }
        }
        else {
            return Button(action: {
                self.editMode = .inactive
            }) {
                Text("Done")
            }
        }
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
                        .font(.system(size: 30))
                        .foregroundColor(.yellow)
                        .padding(.trailing, 5)
                }
            }
        }
    }
}

//
//import SwiftUI
//
//struct SpecialCase {
//    var id: Int
//    var caseData: CaseData
//    var reason: String
//    var favorite: Bool
//}
//
//struct ReviewList: View {
//    @State var completedCases: [(id: Int64, correct: Bool)] = []
//    @State var correctCases: [SpecialCase] = []
//    @State var incorrectCases: [SpecialCase] = []
//
//    @State var show_fav = false
//
//    func updateCases() {
//        completedCases = UserDatabaseManager.shared.getListOfCompletedCases()
//        correctCases.removeAll()
//        incorrectCases.removeAll()
//        for completedCase in completedCases {
//            do {
//                let caseData: CaseData = try CaseDatabaseManager.shared.getCaseById(Id: completedCase.id)
//                let specialCase = SpecialCase(
//                    id: caseData.id,
//                    caseData:caseData,
//                    reason: try UserDatabaseManager.shared.getUserCaseById(Id: completedCase.id).reason,
//                    favorite: try UserDatabaseManager.shared.checkCaseFavorite(idInput: completedCase.id)
//                )
//                if completedCase.correct {
//                    correctCases.append(specialCase)
//                } else {
//                    incorrectCases.append(specialCase)
//                }
//            } catch CaseError.runtimeError(let errorMessage) {
//                print(errorMessage)
//            } catch {
//                print("Other errors")
//            }
//        }
//    }
//
//    var body: some View {
//        //the list will be sorted by the key, which is the category
//
//        ZStack {
//            Color.lighterGray
//            List{
//                Toggle(isOn: $show_fav){
//                                    Text("Show Favorites Only")
//                                }
//                    Section(header: Text("Correct")){
//                        ForEach(self.correctCases, id: \.id) { correctCase in
//                            if correctCase.favorite || !show_fav {
//                                NavigationLink(
//                                    destination: ReviewCase(caseData: correctCase.caseData, reason: correctCase.reason, firstDiagnosis: false, stepsList: .constant([]), secondsTotal: 0)){
//                                    ReviewListCell(caseData: correctCase.caseData, correct: true, favorite: correctCase.favorite)
//                                }
//                            }
//                        }
//                    }
//                    Section(header: Text("Incorrect")){
//                        ForEach(self.incorrectCases, id: \.id) { incorrectCase in
//                            if incorrectCase.favorite || !show_fav {
//                                NavigationLink(
//                                    destination: ReviewCase(caseData: incorrectCase.caseData, reason: incorrectCase.reason, firstDiagnosis: false, stepsList: .constant([]), secondsTotal: 0)){
//                                    ReviewListCell(caseData: incorrectCase.caseData, correct: false, favorite: incorrectCase.favorite)
//                                }
//                            }
//                        }
//                    }
//                }
//            .navigationBarTitle("Review Cases")
//        }
//        .onAppear {
//            updateCases()
//        }
//    }
//}
//
//struct ReviewList_Previews: PreviewProvider {
//    static var previews: some View {
//        ReviewList()
//    }
//}
//
//struct ReviewListCell: View {
//    var caseData: CaseData
//    var correct: Bool
//    var favorite: Bool
//    private var diagnosisColor: Color
//
//    init(caseData: CaseData, correct: Bool, favorite: Bool) {
//        self.caseData = caseData
//        self.correct = correct
//        self.favorite = favorite
//
//        if caseData.correctDiagnosis == "COPD" {
//            self.diagnosisColor = Color.blue
//        } else if caseData.correctDiagnosis == "Heart failure" {
//            self.diagnosisColor = Color.orange
//        } else {
//            self.diagnosisColor = Color.purple
//        }
//    }
//
//    var body: some View {
//
//        HStack {
//            VStack(alignment: .leading) {
//                HStack {
//                    Text("Case \(caseData.caseId)")
//                        .font(.system(size: 20))
//                        .fontWeight(.semibold)
//                    if correct {
//                        Image(systemName: "checkmark")
//                            .font(.headline)
//                            .foregroundColor(.green)
//                            .padding(.trailing, 5)
//                    } else {
//                        Image(systemName: "xmark")
//                            .font(.headline)
//                            .foregroundColor(.red)
//                            .padding(.trailing, 5)
//                    }
//                }
//                Text("\(caseData.correctDiagnosis)")
//                    .font(.system(size: 12))
//                    .fontWeight(.semibold)
//                    .foregroundColor(diagnosisColor)
//                    .padding(.bottom, 1)
//                Text("Difficulty")
//                    .foregroundColor(Color.gray)
//                    .italic()
//                Text(caseData.difficulty)
//                    .foregroundColor(Color.hotPink)
//                    .font(.system(size: 12))
//                    .fontWeight(.semibold)
//            }
//            HStack {
//                Avatar(gender: caseData.gender, age: caseData.age, small: true)
//
//            }
//            Spacer()
//            if favorite {
//                HStack {
//                    Image(systemName: "heart.fill")
//                        .font(.system(size: 30))
//                        .foregroundColor(.yellow)
//                        .padding(.trailing, 5)
//                }
//            }
//        }
//    }
//}
