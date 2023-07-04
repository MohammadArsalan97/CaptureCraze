//
//  Video.swift
//  CaptureCraze
//
//  Created by Mohammad Arsalan on 27/06/2023.
//

import Foundation

struct Video: Identifiable {
    let id = UUID()
    let title: String
    let videoId: String
    let createdAt: Date
    let thumbnail: String?
    let url: String?
    
    var formattedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
         let dateInString = dateFormatter.string(from: createdAt)
            let outputFormatter = DateFormatter()
        if let date = dateFormatter.date(from: dateInString) {
            outputFormatter.dateFormat = "d MMMM yyyy 'at' h:mm a"
            let outputString = outputFormatter.string(from: date)
            return outputString
        }
        return dateInString
        
    }
    
}
