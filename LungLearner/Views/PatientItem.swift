//
//  PatientItem.swift
//  CaseReview_Demo
//
//  Created by frank shen on 10/12/20.
//

import SwiftUI

struct tag: View{
    var title:String
    var body: some View{
        Circle()
            .frame(width: 20, height: 20)
            .overlay(Text(title)).foregroundColor(.white)
    }
}
struct PatientItem: View {
    var patient: CaseData
    var correct: Bool
    
    var body: some View {
        HStack( alignment: .center) {
            
            Text("Case \(patient.id)")
            
            Spacer()
            
            HStack {
                Avatar(gender: patient.gender, age: patient.age, small: true)
                Text("\(patient.correctDiagnosis)")
                    .font(.system(size: 15))
                    .frame(width: 80)
                    .padding(.trailing, 5)
//                    .foregroundColor(.white)
//                    .padding(5)
//                    .background(
//                        RoundedRectangle(cornerRadius: 10)
//                            .fill(Color.hotPink)
//                            .frame(width: 100)
//                    )
//                    .padding(.trailing, 5)
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
            
        }
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.hotPink)
        )
        .padding()
        
    }
}


struct PatientItem_Previews: PreviewProvider {
    static var previews: some View {
        PatientItem(patient: testCaseData, correct: true)
    }
}
