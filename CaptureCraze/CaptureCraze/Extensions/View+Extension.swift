//
//  View+Extension.swift
//  CaptureCraze
//
//  Created by Mohammad Arsalan on 27/06/2023.
//

import SwiftUI

extension View {
    func navigationBar(title: String, onCameraTapped: @escaping (() -> Void)) -> some View {
        modifier(NavigationBarTitle(title: title, onCameraTapped: onCameraTapped))
    }
}
