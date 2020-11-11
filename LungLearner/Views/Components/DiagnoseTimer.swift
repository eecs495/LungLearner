//
//  DiagnoseTimer.swift
//  LungLearner
//
//  Created by Audrey Ladd on 11/8/20.
//

import SwiftUI


struct DiagnoseTimer: View {
    var secondsHere: Int
    var secondsTotal: Int
    
    var body: some View {
        HStack {
            Text("\((secondsHere + secondsTotal) / 60):")
                .padding(.trailing, -8)
            if (secondsHere + secondsTotal) % 60 < 10 {
                Text("0\((secondsHere + secondsTotal) % 60)")
            } else {
                Text("\((secondsHere + secondsTotal) % 60)")
            }
        }
//        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
//            self.isActive = false
//        }
//        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
//            self.isActive = true
//        }
    }
}

//struct DiagnoseTimer_Previews: PreviewProvider {
//    static var previews: some View {
//        DiagnoseTimer()
//            .environmentObject(TimeToDiagnose())
//    }
//}
