//
//  VideoPlayerView.swift
//  CourseApp
//
//  Created by Elvis Rexha on 19/04/2024.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
    let videoURL: URL
    @State private var isFullScreen = false


    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25.0)
                .frame(width: 360, height: 470)
                .foregroundColor(.gray)
            
            VideoPlayer(player: AVPlayer(url: videoURL))
                .frame(width: 360, height: 470)
            
            Button(action: {
                isFullScreen.toggle()
            }) {
                Image(systemName: "square.and.arrow.up")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 20, height: 20)
                    .padding()
            }
            .foregroundColor(.white)
            .offset(x: 160, y: 70)
            .opacity(isFullScreen ? 0 : 1)
        }
        .fullScreenCover(isPresented: $isFullScreen) {
            VideoPlayer(player: AVPlayer(url: videoURL))
                .edgesIgnoringSafeArea(.all)
        }
    }
}


#Preview {
    CourseDetailView(course: Course.mockCourses()[0], hideTabBar: .constant(false))
        .environmentObject(HomeViewModel())
}
