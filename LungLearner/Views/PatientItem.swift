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
    var patient:CaseData
    var case_color:Color
    
    var body: some View {
        HStack( alignment: .center) {
            
                Text("Case \(patient.id)").foregroundColor(case_color)

            Spacer()

            VStack(alignment: .trailing) {
                HStack(alignment: .center) {
                    Text(" \(patient.age) ")
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .padding(2)
                        .cornerRadius(5)
                    
                    Text(" \(patient.gender) ")
                        .background(Color.orange)
                        .foregroundColor(.white)
                        .padding(2)
                        .cornerRadius(5)
                }
                    Text(" \(patient.correctDiagnosis) ")
                        .background(Color.red)
                        .foregroundColor(.white)
                        .padding(2)
                        .cornerRadius(5)
            }
        }
        
    }
}

