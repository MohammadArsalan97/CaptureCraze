//
//  NavigationBarTitle.swift
//  CaptureCraze
//
//  Created by Mohammad Arsalan on 27/06/2023.
//

import SwiftUI

struct NavigationBarTitle: ViewModifier {
    
    var title: String
    var onCameraTapped: (() -> Void)
    func body(content: Content) -> some View {
        
        if #available(iOS 14.0, *) {
            content
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle(title)
                .toolbar {
                    
                    Button {
                        onCameraTapped()
                    } label: {
                        Image(systemName: "video.badge.plus")
                    }
                    
                }
        } else {
            content
                .navigationBarTitle(title)
                .navigationBarItems(
                    trailing: Button {
                        onCameraTapped()
                    } label: {
                        Image(systemName: "video.badge.plus")
                    })
        }
        
        
    }
}
