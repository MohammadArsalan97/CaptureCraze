//
//  CameraView.swift
//  CaptureCraze
//
//  Created by Mohammad Arsalan on 27/06/2023.
//

import SwiftUI
import AVFoundation

struct CameraView: View {
    
    @EnvironmentObject var cameraModel: CameraViewModel
    
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            // MARK: Camera View
            GeometryReader { proxy in
                let size = proxy.size
                CameraPreview(size: size)
                    .environmentObject(cameraModel)
            }
            .alert(isPresented: $cameraModel.alert) {
                Alert(title: Text("Please Enable Camera Access and Audio Access"))
            }
            
            VStack(spacing: 10) {
                if cameraModel.isUploading {
                    ProgressBar(progress: $cameraModel.progress)
                }
                Spacer()
                Text(cameraModel.timerString)
                    .onReceive(cameraModel.timer) { _ in
                        cameraModel.updateTime()
                    }
                // MARK: Camera Controls
                ZStack{
                    
                    NavigationLink(isActive: $cameraModel.showPreview) {
                        if let url = cameraModel.previewURL {
                            VideoPlayerView(url: url)
                        }
                    } label: {
                        EmptyView()
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Button {
                        cameraModel.showPreview = true
                    } label: {
                        if let url = cameraModel.previewURL, let thumbnail = url.generateThumbnail() {
                            Image(uiImage: thumbnail)
                                .resizable()
                                .frame(width: 60, height: 60)
                                .cornerRadius(10)
                        }
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 20)
                    
                    
                    Button {
                        
                        if cameraModel.isRecording {
                            cameraModel.stopRecording()
                        } else {
                            cameraModel.startRecording()
                        }
                    } label: {
                        Image(systemName: cameraModel.isRecording ? "stop.circle" : "record.circle")
                            .resizable()
                            .renderingMode(.template)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 60, height: 60)
                            .foregroundColor(.white)
                    }
                    .alert(isPresented: $cameraModel.errorAlert) {
                        Alert(title: Text("\(cameraModel.errorMessage)"))
                    }
                    .actionSheet(isPresented: $cameraModel.uploadVideoAlert) {
                        ActionSheet(
                            title: Text("Are you sure you want to upload this video!"),
                            buttons: [
                                .default(Text("Upload")) {
                                    
                                    if let url = cameraModel.previewURL {
                                        cameraModel.upload(url: url)
                                    }
                                    
                                },
                                .destructive(Text("Cancel"))
                            ]
                        )
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                }
                .padding(.bottom, 30)
            }
        }
        .preferredColorScheme(.dark)
        .onAppear {
            cameraModel.checkPermission()
        }
        .onDisappear {
            cameraModel.session.stopRunning()
        }
    }
}

struct CameraView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView()
    }
}

struct CameraPreview: UIViewRepresentable {
    
    @EnvironmentObject var camera: CameraViewModel
    var size: CGSize
    
    func makeUIView(context: Context) -> UIView {
        
        let view = UIView()
        
        DispatchQueue.global().async {
            DispatchQueue.main.async {
                camera.preview = AVCaptureVideoPreviewLayer(session: camera.session)
                camera.preview.frame.size = size
                
                camera.preview.videoGravity = .resizeAspectFill
                view.layer.addSublayer(camera.preview)
            }
            camera.session.startRunning()
        }
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {
        
    }
    
}
