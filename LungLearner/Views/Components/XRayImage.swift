//
//  XRayImage.swift
//  LungLearner
//
//  Created by Audrey Ladd on 11/5/20.
//

import SwiftUI

struct XRayImage: View {
    @State private var zoomLevel: CGFloat = 1
    
    var body: some View {
        Image("xRay1")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .scaleEffect(self.zoomLevel)
            .gesture(MagnificationGesture().onChanged({ (value) in self.zoomLevel = value }))
    }
}

struct XRayImage_Previews: PreviewProvider {
    static var previews: some View {
        XRayImage()
    }
}
