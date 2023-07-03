//
//  Video.swift
//  CaptureCraze
//
//  Created by Mohammad Arsalan on 27/06/2023.
//

import Foundation

//struct Video: Identifiable {
//    let id: UUID
//    let name: String
//    let url: URL
//    let duration: TimeInterval
//
//    init(id: UUID = UUID(), name: String, url: URL, duration: TimeInterval) {
//        self.id = id
//        self.name = name
//        self.url = url
//        self.duration = duration
//    }
//
//
//}

struct Video: Identifiable {
    let id = UUID()
    let title: String
    let size: String
    let thumbnail: String
    
}
