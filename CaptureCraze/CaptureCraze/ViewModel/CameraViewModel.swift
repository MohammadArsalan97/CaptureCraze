//
//  CameraViewModel.swift
//  CaptureCraze
//
//  Created by Mohammad Arsalan on 02/07/2023.
//

import AVFoundation

class CameraViewModel: NSObject, ObservableObject {
    @Published var isRecording: Bool = false
    @Published var recordedURL: URL?
    
    @Published var alert: Bool = false
    @Published var uploadVideoAlert: Bool = false
    @Published var session = AVCaptureSession()
    
    @Published var output = AVCaptureMovieFileOutput()
    
    // Properties For Video Preview
    @Published var previewURL: URL?
    @Published var showPreview: Bool = false
    
    @Published var preview: AVCaptureVideoPreviewLayer!
    
    
    @Published var timerString = "00:00"
    @Published var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @Published var startTime =  Date()
    
    func startTimer() {
            self.timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
        }
    
    func stopTimer() {
            self.timer.upstream.connect().cancel()
        }
    
    func updateTime() {
        if isRecording {
            let duration = Date().timeIntervalSince(startTime)
                        let formatter = DateComponentsFormatter()
                        formatter.allowedUnits = [.minute, .second]
                        formatter.unitsStyle = .positional
                        formatter.zeroFormattingBehavior = .pad
            timerString = formatter.string(from: duration) ?? ""
            
        }
    }
    
    func checkPermission() {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
            
        case .notDetermined:
            AVCaptureDevice.requestAccess(for: .video) { status in
                if status {
                    self.setup()
                }
            }
        case .denied:
            self.alert.toggle()
            return
        case .authorized:
            setup()
            return
        default:
            return
        }
    }
    
    func setup() {
        
        do {
            
            // configuration
            self.session.beginConfiguration()
            
            
            let cameraDevice = AVCaptureDevice.default(for: .video)
            
            let videoInput = try AVCaptureDeviceInput(device: cameraDevice!)
            
            let audioDevice = AVCaptureDevice.default(for: .audio)
            
            let audioInput = try AVCaptureDeviceInput(device: audioDevice!)
            
            if self.session.canAddInput(videoInput) && self.session.canAddInput(audioInput) {
                self.session.addInput(videoInput)
                self.session.addInput(audioInput)
            }
            
            if self.session.canAddOutput(self.output) {
                self.session.addOutput(self.output)
            }
            
            self.session.commitConfiguration()
            
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func startRecording() {
        
        let tempURL = NSTemporaryDirectory() + "\(Date()).mov"
        
        output.startRecording(to: URL(fileURLWithPath: tempURL), recordingDelegate: self)
        isRecording = true
        
        timerString = "00:00"
                            startTime = Date()
                            // start UI updates
                            self.startTimer()
    }
    
    func stopRecording() {
        output.stopRecording()
        isRecording = false
        uploadVideoAlert = true
        
        self.stopTimer()
    }
}

extension CameraViewModel: AVCaptureFileOutputRecordingDelegate {
    func fileOutput(_ output: AVCaptureFileOutput, didFinishRecordingTo outputFileURL: URL, from connections: [AVCaptureConnection], error: Error?) {
        if let error = error {
            debugPrint(error.localizedDescription)
            return
        }
        debugPrint(outputFileURL)
        previewURL = outputFileURL
    }
}
