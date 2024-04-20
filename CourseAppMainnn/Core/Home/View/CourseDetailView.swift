//
//  CourseDetailView.swift
//  CourseApp
//
//  Created by Elvis Rexha on 19/04/2024.
//

import SwiftUI
import AVKit
import AlertX

struct CourseDetailView: View {
    let course: Course
    
    @EnvironmentObject var homeViewModel: HomeViewModel
    
    @Environment(\.dismiss) private var dismiss
    @Binding var hideTabBar: Bool
    
    @State private var enrollButtonPressed: Bool = false
    
    let videoUrl: URL? = Bundle.main.url(forResource: "yt", withExtension: "mp4")
    
    var body: some View {
        GeometryReader { geo in
            
            let imageHeight = geo.size.height / 3
            
            ScrollView {
                LazyVStack(spacing: 0, pinnedViews: [.sectionFooters]) {
                    Section {
                        Image(course.courseImage)
                            .resizable()
                            .frame(height: imageHeight)
                            .shadow(color: .white, radius: 20)

                        VStack(spacing: 0) {
                            Text(course.title)
                                .titleTextModifier(color: .white)
                                .padding(.top, -70)
                                .font(.system(size: 40))

                                Text(course.fullDescription)
                                .titleTextModifier(color: .white)
                                
                                
                                Text("Author: \(course.instructor)")
                                .titleTextModifier(color: Color(.systemGray))
                                    .foregroundStyle(Color(.systemGray3))
                                    .font(.headline)
                        }
                        
                        VStack {
                            Text("Course Videos")
                                .titleTextModifier(color: .white)
                                .font(.title)
                                .padding(.top, -50)
                            
                            ScrollView(.horizontal) {
                                HStack {
                                    ForEach(course.videos, id: \.self) { videoURL in
                                        VideoPlayerView(videoURL: videoURL)
                                            .frame(height: 200)
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                            .containerRelativeFrame(.horizontal)
 
                                    }
                                    .scrollTransition { content, phase in
                                            content
                                            .scaleEffect(phase.isIdentity ? 1 : 0.78)
                                    }
                                }

                                .scrollTargetLayout()
                                
                            }
                            
                            .scrollIndicators(.hidden)
                            .scrollTargetBehavior(.viewAligned)
                            
                        }

                    } footer: {
                        HStack {
                            Button(action: {
                                withAnimation(.bouncy) {
                                    homeViewModel.enrollCourse(course)
                                    enrollButtonPressed = true
                                }
                                
                            }, label: {
                                Text("Enroll to Course")
                                    .foregroundStyle(.bg)
                                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .center)
                                    .font(.title3)
                                    .bold()
                            })
                            .frame(width: geo.size.width / 1.4, height: geo.size.height * 0.08)
                            .background(
                                ZStack {
                                    
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundStyle(.white)
                                        .shadow(color: .white, radius: 20)
                                    
                                    
                                }
                            
                            )
                            .scaleEffect(enrollButtonPressed ? 0.93 : 1)
                            
                            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                Image(systemName: "bookmark")
                                    .foregroundStyle(.black)
                                    .bold()
                            })
                            .frame(width: geo.size.width * 0.17, height: geo.size.height * 0.08)
                            .background(.white, in: RoundedRectangle(cornerRadius: 10))
                        }
                        
                        
                        
                    }
                    .padding(.bottom, 60)

                    
                }
                .overlay(alignment: .topLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "chevron.left")
                            .foregroundStyle(.white)
                            .bold()
                    }
                    .frame(width: 40, height: 40)
                    .background(
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundStyle(.button)
                                .shadow(color: .button, radius: 8)
                        }
                    
                    )
                    .padding(.leading, 30)
                    .padding(.top, 70)
                    
                }
               
                
                
            }
            
            
            .ignoresSafeArea()
            .scrollIndicators(.hidden)
            .background(.bg)
        }
        .onAppear {
            withAnimation(.smooth) {
                hideTabBar = true
                
            }
        }
        .alertX(isPresented: $homeViewModel.showAlert) {
            customAlertX(title: homeViewModel.alertTitle, message: homeViewModel.alertSubTitle)
        }
        
        
    }
    
    @ViewBuilder
    private func customAlertX(title: String, message: String) -> AlertX {
        AlertX(title: Text(title), message: Text(message), primaryButton: .default(Text("OK"), action: {
            withAnimation(.bouncy) {
                enrollButtonPressed = false
            }
        }), secondaryButton: .cancel(Text("Cancel"), action: {
            withAnimation(.bouncy) {
                enrollButtonPressed = false
            }
        }), theme: .custom(windowColor: .bg, alertTextColor: .white, enableShadow: false, enableRoundedCorners: true, enableTransparency: false, cancelButtonColor: .button, cancelButtonTextColor: .white, defaultButtonColor: .black, defaultButtonTextColor: .white, roundedCornerRadius: 20), animation: .classicEffect())
        
    }
    
}


#Preview(body: {
    CourseDetailView(course: Course.mockCourses()[0], hideTabBar: .constant(false))
        .environmentObject(HomeViewModel())
})


