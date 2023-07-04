//
//  VideoListView.swift
//  CaptureCraze
//
//  Created by Mohammad Arsalan on 27/06/2023.
//

import SwiftUI
import ApiVideoClient
import Kingfisher

struct VideoListView: View {
    
    @State private var showCamera = false
    @StateObject var viewModel = CameraViewModel()
    
    
    
    var body: some View {
        NavigationView {
            
            ZStack{
                VStack {
                    if viewModel.videos.isEmpty && !viewModel.isLoading {
                        Text("No Videos!")
                        
                    } else {
                        List(viewModel.videos) { video in
                            NavigationLink {
                                if let url = video.url {
                                    VideoPlayerView(url: URL(string: url)!)
                                }
                            } label: {
                                VideoView(video: video)
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
                .onAppear(perform: {
                    viewModel.fetchVideos()
                })
                .navigationBar(title: "Capture Craze") {
                    showCamera.toggle()
                }
                
//                VStack {
//                    Text("Loading")
//
//                }
                ActivityIndicator(isAnimating: $viewModel.isLoading, style: .large)
//                .frame(width: 150,
//                       height: 150)
//                .background(Color.secondary.colorInvert())
//                .foregroundColor(Color.primary)
//                .cornerRadius(20)
//                .opacity(self.isShowing ? 1 : 0)
            }
            
        }
    }
}

struct VideoListView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListView()
    }
}

extension VideoListView {
    
    
    struct VideoView: View {
        var video: Video
        
        var body: some View {
            HStack {
                if let thumbnail = video.thumbnail {
                    
                    KFImage.url(URL(string: thumbnail))
                    
                        .resizable()
                        .frame(width: 80, height: 60)
                        .cornerRadius(10)
                } else {
                    Image(systemName: "photo")
                        .resizable()
                        .frame(width: 80, height: 60)
                        .cornerRadius(10)
                }
                VStack(alignment: .leading) {
                    Text(video.title)
                        .font(.headline)
                    Text("Created At: \(video.formattedDate)")
                        .font(.caption)
                }
            }
        }
    }
}
