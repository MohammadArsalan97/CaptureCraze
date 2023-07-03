//
//  VideoPlayerView.swift
//  CaptureCraze
//
//  Created by Mohammad Arsalan on 02/07/2023.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {

    var url: URL
    @Binding var showPreview: Bool
    var body: some View {
        GeometryReader { proxy in
            let size = proxy.size

            Player(url: url)
                .aspectRatio(contentMode: .fill)
                .frame(width: size.width, height: size.height)
        }
    }
}

struct VideoPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        VideoPlayerView(url: URL(fileURLWithPath: ""), showPreview: .constant(false))
    }
}


struct Player: UIViewControllerRepresentable {
    
    var url: URL
    func makeUIViewController(context: UIViewControllerRepresentableContext<Player>) -> AVPlayerViewController {
        
        let controller = AVPlayerViewController()
        let player = AVPlayer(url: url)
        controller.player = player
        return controller
        
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: UIViewControllerRepresentableContext<Player>) {

    }
}
