//
//  CustomPagingIndicator.swift
//  FlySolo_0528
//
//  Created by Gavin Kwon on 9/2/23.
//

import SwiftUI

struct CustomPagingIndicator: View {
    
    var currentIndex: Int
    var total: Int
    
    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<total, id: \.self) { index in
                Circle()
                    .fill(index == currentIndex ? Color.red : Color.gray)
                    .frame(width: 6, height: 6)
                    .opacity(0.5)
            }
        }
        .padding(.bottom)
    }
}
