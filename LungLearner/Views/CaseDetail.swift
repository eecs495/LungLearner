//
//  CaseDetail.swift
//  LungLearner
//
//  Created by Audrey Ladd on 10/19/20.
//

import SwiftUI

struct CaseDetail: View {
    var patient:FranksCaseData
    var body: some View {
        List{
            ZStack(alignment: .bottom){
                //Xray of the case
                Image("patient.xRayName")
                    .resizable()
                    .aspectRatio(contentMode:.fit)
                    .cornerRadius(10)
                Rectangle()
                    .frame(height:80)
                    .opacity(0.25)
                    .blur(radius: 10)
                HStack{
                    VStack(alignment: .leading, spacing:8){
                        //id of the case in white in the title
                        Text(String(patient.id))
                            .font(.largeTitle)
                            .foregroundColor(Color.white)
                    }.padding(.leading)
                    .padding(.bottom)
                    
                    Spacer()
                }
            }
            
            VStack(alignment: .leading){
                //the history of the patient, I don't know the format, so
                //I just put history 1 here. We can add more later
                Text(patient.history1)
                    .font(.body)
                    .lineLimit(nil)
                    .lineSpacing(12)
            }.padding(.top)
            .padding(.bottom)
            
        }.edgesIgnoringSafeArea(.top)
        
    }
}

//struct CaseDetail_Previews: PreviewProvider {
//    static var previews: some View {
//        CaseDetail()
//    }
//}
