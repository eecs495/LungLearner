//
//  XRayImage.swift
//  LungLearner
//
//  Created by Audrey Ladd on 11/5/20.
//

import SwiftUI

import Combine
import Foundation

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    private let url: URL

    init(url: URL) {
        self.url = url
    }

    deinit {
        cancel()
    }
    
    private var cancellable: AnyCancellable?

    func load() {
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in self?.image = $0 }
    }
    
    func cancel() {
        cancellable?.cancel()
    }
}

struct AsyncImage: View {
    @StateObject private var loader: ImageLoader

    init(url: URL) {
        //self.placeholder = placeholder()
        _loader = StateObject(wrappedValue: ImageLoader(url: url))
    }

    var body: some View {
        content
            .onAppear(perform: loader.load)
    }
    
    private var content: some View {
        Group {
            if loader.image != nil {
                Image(uiImage: loader.image!)
                    .resizable()
            }
            else {
                Text(" ")
            }
        }
    }
}

struct XRayImage: View {
    @State private var zoomLevel: CGFloat = 1
    let url = URL(string: "https://lungxrays.s3.amazonaws.com/247.jpg")!
    
    var body: some View {
        AsyncImage(
            url: url
        ).aspectRatio(contentMode: .fit)
    }
}

struct XRayImage_Previews: PreviewProvider {
    static var previews: some View {
        XRayImage()
    }
}
