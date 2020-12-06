//
//  DifficultyButtons.swift
//  LungLearner
//
//  Created by Audrey Ladd on 12/3/20.
//

import SwiftUI

struct DifficultyButtons: View {
    @Binding var selectedDifficulty: Difficulty?
    @State private var selections: [Bool] = [true, false, false, false]

    var body: some View {
        HStack {
            Group {
                DifficultyButton(selectedDifficulty: $selectedDifficulty, selections: $selections, difficulty: nil, index: 0, text: "Random")
                DifficultyButton(selectedDifficulty: $selectedDifficulty, selections: $selections, difficulty: .Easy, index: 1, text: "Easy")
                DifficultyButton(selectedDifficulty: $selectedDifficulty, selections: $selections, difficulty: .Medium, index: 2, text: "Medium")
                DifficultyButton(selectedDifficulty: $selectedDifficulty, selections: $selections, difficulty: .Hard, index: 3, text: "Hard")
            }
            .padding(.horizontal, 5)
        }

    }

}

//struct DifficultyButtons_Previews: PreviewProvider {
//    static var previews: some View {
//        DifficultyButtons()
//    }
//}

struct DifficultyButton: View {
    @Binding var selectedDifficulty: Difficulty?
    @Binding var selections: [Bool]
    var difficulty: Difficulty?
    var index: Int
    var text: String
    
    var body: some View {
        VStack {
            Button(action: {
                selectedDifficulty = difficulty
                for i in 0...3 {
                    if index == i {
                        selections[i] = true
                    } else {
                        selections[i] = false
                    }
                }
            }) {
                Circle()
                    .fill(selections[index] ? Color.hotPink : Color.lightGray)
                    .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    
            }
            Text(text)
        }
    }
}
