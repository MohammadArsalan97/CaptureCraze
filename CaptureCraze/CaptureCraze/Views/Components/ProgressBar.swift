//
//  ProgressBar.swift
//  CaptureCraze
//
//  Created by Mohammad Arsalan on 05/07/2023.
//

import SwiftUI

struct ProgressBar: View {
    @Binding var progress: Progress

    var body: some View {
        VStack(alignment: .leading) {
            ZStack {
                RoundedRectangle(cornerRadius: 2)
                    .foregroundColor(Color(UIColor.systemGray5))
                
                GeometryReader { metrics in
                    RoundedRectangle(cornerRadius: 2)
                        .foregroundColor(.red)
                        .frame(width: metrics.size.width * CGFloat(progress.fractionCompleted))
                }
                Text( progress.completedUnitCount == progress.totalUnitCount ? "Upload Success!" : "\(progress.completedUnitCount) of \(progress.totalUnitCount)")
                    .font(.footnote)
                    .foregroundColor(.white)
            }.frame(height: 10)
        }
    }
}
