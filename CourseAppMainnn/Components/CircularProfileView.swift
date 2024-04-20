//
//  CircularProfileView.swift
//  CourseApp
//
//  Created by Elvis Rexha on 19/04/2024.
//

import SwiftUI

struct CircularProfileView: View {
    var body: some View {
        ZStack {
            Circle()
                .foregroundStyle(.white)
            
            Circle()
                .padding(3)
        }
        .frame(width: 130, height: 130)
        .shadow(color: .white, radius: 3, x: 3)
        .overlay {
            Image(ImageConstants.CourseImage)
                .resizable()
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
        }
    }
}

#Preview {
    CircularProfileView()
}
