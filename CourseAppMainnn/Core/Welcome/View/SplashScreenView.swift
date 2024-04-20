//
//  SplashScreenView.swift
//  CourseApp
//
//  Created by Elvis Rexha on 19/04/2024.
//

import SwiftUI

struct SplashScreenView: View {
    
    @AppStorage("currentPage") var currentPage = 0
    @Binding var animateWelcomePage: Bool
    
    var body: some View {
        VStack {
            
            VStack(alignment: .leading, spacing: 16) {
                Text("Edu Key")
                    .foregroundStyle(Color(.systemGray))
                    .font(.title)
                
                Text("Well done is\nbetter than\nwell said.")
                    .foregroundStyle(.white)
                    .font(.system(size: 50))
                
                
                
                
            }
            .bold()
            
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            .padding(.leading, 40)
            
            LottieCourseAnimation()
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            
            Button(action: {
                withAnimation(.smooth) {
                    currentPage = 1
                }
            }, label: {
                Text("Start Journey")
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
                    .font(.headline)
                    .frame(width: UIScreen.main.bounds.width / 1.3, height: 60)
                    .background(.button, in: .rect(cornerRadius: 10))
                    .padding(.top, 30)
                    
                
            })
            
            
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
        .background(Color.bg)
        .offset(x: animateWelcomePage ? 0 : -300)
        .animation(.smooth(duration: 1), value: animateWelcomePage)
        .onAppear {
            animateWelcomePage = true
        }
    }
}

#Preview {
    SplashScreenView(animateWelcomePage: .constant(false))
}
