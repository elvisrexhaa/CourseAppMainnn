//
//  LottieCourseAnimation.swift
//  CourseApp
//
//  Created by Elvis Rexha on 19/04/2024.
//

import SwiftUI
import Lottie

struct LottieCourseAnimation: View {
    var body: some View {
        
        VStack {
            LottieView(animation: .named("course"))
                .playbackMode(.playing(.toProgress(1, loopMode: .loop)))
                .resizable()

        }
    }
}

#Preview {
    LottieCourseAnimation()
        .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
}
