//
//  MainMenu.swift
//  LungLearner
//
//  Created by frank shen on 10/2/20.
//

import SwiftUI

struct MainMenu: View {
    var body: some View {
        VStack(alignment: .leading){
            
            NavigationView{
                
            VStack{
                Text("Home").font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/).multilineTextAlignment(.leading)
                Spacer()
                NavigationLink(
                    destination: NewCase()){
                    HomeItem(pic_name: "newCase",title: "New Cases")
                }
                Spacer()
                NavigationLink(
                    destination: Text("Past Cases interface")){
                HomeItem(pic_name: "pastCase",title: "Past Cases")
                }
                Spacer()

            }
            }
        }
    }
}

struct MainMenu_Previews: PreviewProvider {
    static var previews: some View {
        MainMenu()
    }
}
