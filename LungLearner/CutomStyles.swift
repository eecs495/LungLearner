//
//  File.swift
//  LungLearner
//
//  Created by Audrey Ladd on 11/1/20.
//

import SwiftUI


extension Color {
    static let hotPink = Color(red: 255/255, green: 59/255, blue: 114/255)
    static let darkerHotPink = Color(red: 219/255, green: 42/255, blue: 92/255)
    static let lightGray = Color(red: 240 / 255, green: 240 / 255, blue: 240 / 255)
    static let lighterGray = Color(red: 245 / 255, green: 245 / 255, blue: 245 / 255)
}

struct WideButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(Color.white)
            .padding(20)
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(
                Group {
                    if configuration.isPressed {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.darkerHotPink)
                    } else {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.hotPink)
                    }
                }
            )
    }
}

struct NarrowButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(Color.white)
            .padding(10)
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(
                Group {
                    if configuration.isPressed {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.darkerHotPink)
                    } else {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.hotPink)
                    }
                }
            )
    }
}

struct WhiteCard: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
            )
    }
}

extension Text {
    func textStyle<Style: ViewModifier>(_ style: Style) -> some View {
        ModifiedContent(content: self, modifier: style)
    }
}
