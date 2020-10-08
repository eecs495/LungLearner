//
//  Diagnose.swift
//  LungLearner
//
//  Created by Audrey Ladd on 9/29/20.
//

import SwiftUI

struct Diagnose: View {
    @State private var selected: String = ""
    
    var body: some View {
        Text("Deprecated")
//        HStack {
//            ForEach(causes) { cause in
//                VStack {
//                    Button(action: {
//                        if selected == cause.name {
//                            selected = ""
//                        } else {
//                            selected = cause.name
//                        }
//                    }) {
//                        Image(systemName: cause.symbolName)
//                            .font(.title)
//                            .frame(width: 25, height: 25)
//                            .foregroundColor(.black)
//                            .clipShape(Circle())
//                            .padding()
//                            .overlay(
//                                selected == cause.name ? Circle().stroke(Color.yellow, lineWidth: 3) : Circle().stroke(Color.secondary, lineWidth: 3)
//                                )
//                            .padding(2)
//
//                    }
//                    Text(cause.name)
//                        .font(.caption)
//                }
//            }
//        }
    }
}

struct Diagnose_Previews: PreviewProvider {
    static var previews: some View {
        Diagnose()
    }
}

