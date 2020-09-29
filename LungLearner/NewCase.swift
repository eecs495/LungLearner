//
//  ContentView.swift
//  LungLearner
//
//  Created by Audrey Ladd on 9/28/20.
//

import SwiftUI

struct NewCase: View {
    @State private var currentCategory: Int = 0
    
    var body: some View {
        VStack {
            TabView(selection: $currentCategory) {
                ForEach(0 ..< testCategories.count) { index in
                    CategoryView(category: testCategories[index])
                        .tag(index)
                        .padding()
                }
            }
            .tabViewStyle(PageTabViewStyle())
            
            HStack {
                Spacer()
                Button(action: {
                    withAnimation (.easeInOut(duration: 1.0)) {
                        self.currentCategory = (self.currentCategory + 1) % testCategories.count
                    }
                }) {
                    Image(systemName: "arrow.right")
                        .font(.largeTitle)
                        .foregroundColor(Color.white)
                        .padding()
                        .background(Circle().fill(Color.primary))
                }
            }
            .padding()
        }
    }
}

struct NewCase_Previews: PreviewProvider {
    static var previews: some View {
        NewCase()
    }
}
