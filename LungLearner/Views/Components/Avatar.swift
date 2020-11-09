//
//  Avatar.swift
//  LungLearner
//
//  Created by Audrey Ladd on 11/8/20.
//

import SwiftUI

struct Avatar: View {
    var gender: String
    var age: Int
    var small: Bool = false
    private let smallSize: CGFloat = 35
    
    var body: some View {
        
        if gender == "male"{
            if age < 35 {
                Image("YoungMale")
                    .resizable()
                    .frame(width: small ? smallSize : 80, height: small ? smallSize : 80)
            }
            else if age > 65 {
                Image("OldMale")
                    .resizable()
                    .frame(width: small ? smallSize : 80, height: small ? smallSize : 80)
            }
            else {
                Image("Male")
                    .resizable()
                    .frame(width: small ? smallSize : 80, height: small ? smallSize : 80)
            }
        }
        
        else {
            if age < 35 {
                Image("YoungFemale")
                    .resizable()
                    .frame(width: small ? smallSize : 80, height: small ? smallSize : 80)
            }
            else if age > 65 {
                Image("OldFemale")
                    .resizable()
                    .frame(width: small ? smallSize : 80, height: small ? smallSize : 80)
            }
            else {
                Image("Female")
                    .resizable()
                    .frame(width: small ? smallSize : 80, height: small ? smallSize : 80)
            }
        }
        
    }
}

struct Avatar_Previews: PreviewProvider {
    static var previews: some View {
        Avatar(gender: "male", age: 20)
    }
}
