//
//  HomeItem.swift
//  LungLearner
//
//  Created by frank shen on 10/3/20.
//

import SwiftUI

struct HomeItem: View {
    var pic_name:String;
    var title:String;
    var body: some View {
        VStack{
//            Image(pic_name)
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 300, height: 170, alignment: .center)
//                .shadow(radius: 10)
                
            
            
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/){
                Text(title)
                    .font(.headline)
                    .multilineTextAlignment(.center)
            }
        }
    }
}

struct HomeItem_Previews: PreviewProvider {
    static var previews: some View {
        HomeItem(pic_name: "newCase",title: "New Cases")
    }
}
