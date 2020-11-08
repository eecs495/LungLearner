import SwiftUI

struct ReviewList: View {
    //data_list is the array of all the case data
    
    //.correct will be the enum that used to decide the category of the Case,
    //in this case, the category would be correct and wrong cases
  
    var correctCases: [CaseData]
    var incorrectCases: [CaseData]
    
    var body: some View {
            //the list will be sorted by the key, which is the category
            
            List{
                Section(header: Text("Correct")){
                    ForEach(self.correctCases, id: \.id) { caseData in
                        NavigationLink(
                            destination: ReviewCase(caseData: caseData, firstDiagnosis: false)){
                            PatientItem(patient:caseData, case_color:Color.green )
                        }
                    }
                }
                Section(header: Text("Incorrect")){
                    ForEach(self.incorrectCases, id: \.id) { caseData in
                        NavigationLink(
                            destination: ReviewCase(caseData: caseData, firstDiagnosis: false)){
                            PatientItem(patient:caseData, case_color:Color.red )
            
                        }
                    }
                }
            }
            .navigationBarTitle("Review Cases")
    }
}

struct ReviewList_Previews: PreviewProvider {
    static var previews: some View {
        ReviewList(correctCases: testCorrectCaseDataList, incorrectCases: testIncorrectCaseDataList)
    }
}
