//
//  VideoListView.swift
//  CaptureCraze
//
//  Created by Mohammad Arsalan on 27/06/2023.
//

import SwiftUI

struct VideoListView: View {
    @State private var showCamera = false
    @StateObject var viewModel = CameraViewModel()
    
    let videos: [Video] = [
        //            Video(title: "Video 1", size: "100 MB", thumbnail: "video1_thumbnail"),
        //            Video(title: "Video 2", size: "75 MB", thumbnail: "video2_thumbnail"),
        //            Video(title: "Video 3", size: "120 MB", thumbnail: "video3_thumbnail"),
    ]
    
    var body: some View {
        NavigationView {
            
            
            VStack {
                if videos.isEmpty {
                    Text("No Videos!")
                        
                } else {
                    List(videos) { video in
                        HStack {
                            Image(video.thumbnail)
                                .resizable()
                                .frame(width: 80, height: 60)
                            
                            VStack(alignment: .leading) {
                                Text(video.title)
                                    .font(.headline)
                                Text("Size: \(video.size)")
                                    .font(.subheadline)
                            }
                        }
                    }
                }
                
                NavigationLink(isActive: $showCamera) {
                    CameraView()
                        .environmentObject(viewModel)
                } label: {
                    EmptyView()
                }
            }
            .navigationBar(title: "Capture Craze") {
                print("Tapped On Camera...")
                showCamera.toggle()
            }
        }
    }
}

struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}
