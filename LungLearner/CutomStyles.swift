//
//  File.swift
//  LungLearner
//
//  Created by Audrey Ladd on 11/1/20.
//

import SwiftUI


extension Color {
    static let hotPink = Color(red: 255/255, green: 59/255, blue: 114/255)
    static let lightGray = Color(red: 240 / 255, green: 240 / 255, blue: 240 / 255)
    static let lighterGray = Color(red: 245 / 255, green: 245 / 255, blue: 245 / 255)
}

struct WideButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(Color.hotPink)
            .padding(20)
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(
                Group {
                    if configuration.isPressed {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.lightGray)
                    } else {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.lighterGray)
                    }
                }
            )
    }
}

struct NarrowButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(Color.hotPink)
            .padding(5)
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(
                Group {
                    if configuration.isPressed {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.lightGray)
                    } else {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.lighterGray)
                    }
                }
            )
    }
}
