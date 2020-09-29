//
//  CategoryView.swift
//  LungLearner
//
//  Created by Audrey Ladd on 9/29/20.
//

import SwiftUI

struct CategoryView: View {
    var category: Category
    @State var showImage: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                Image(category.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200, alignment: .center)
                Text(category.title)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                Text(category.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .foregroundColor(.secondary)
                    .padding()
                if imageCategories.contains(category.imageName) {
                    Button(action: {
                        self.showImage.toggle()
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.largeTitle)
                    }
                    .padding(.bottom)
                    .disabled(self.showImage)
                }
            }
            .blur(radius: self.showImage ? 5 : 0)
            if self.showImage {
                VStack {
                    Image("\(category.imageName)Sample")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .overlay(Rectangle().stroke(Color.white, lineWidth: 4))
                        .shadow(radius: 10)
                    Button(action: {
                        self.showImage.toggle()
                    }) {
                        Image(systemName: "multiply.circle.fill")
                            .font(.largeTitle)
                            .foregroundColor(.red)
                    }
                    .shadow(radius: 10)
                    .padding()
                }
                .padding()
            }
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView(category: testCategories[5])
    }
}
