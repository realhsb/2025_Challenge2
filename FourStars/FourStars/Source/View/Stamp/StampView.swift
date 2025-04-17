//
//  StampView.swift
//  FourStars
//
//  Created by Soop on 4/15/25.
//

import SwiftUI

struct StampView: View {
    
//    @Binding 

    var body: some View {
        VStack(spacing: 0) {
            
            Text("2025년 4월 4일")
            
            VStack(spacing: -50) {
//                ForEach(Array(starList2.enumerated()), id: \.offset) { index, image in
//                    
//                    
//                    
//                    if index % 2 == 0 {
//                        HStack {
//                            Image(uiImage: image)
//                            Spacer()
//                                .frame(width: 60)
//                        }
//                    } else {
//                        HStack {
//                            Spacer()
//                                .frame(width: 60)
//                            Image(uiImage: image)
//                        }
//                    }
//                }
            }
            .padding(.horizontal, 50)
            .padding(.vertical, 40)
            .background(Color.black)
        }
        .clipShape(RoundedRectangle(cornerRadius: 16))
    }
}

#Preview {
    StampView()
}
