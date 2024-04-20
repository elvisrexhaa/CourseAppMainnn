//
//  ProfileView.swift
//  CourseApp
//
//  Created by Elvis Rexha on 19/04/2024.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var homeViewModel: HomeViewModel
    
    @StateObject var profileViewModel = ProfileViewModel()

    var body: some View {
        ZStack {
            Color.bg.ignoresSafeArea()
            
            VStack {
                VStack(alignment: .leading, spacing: 12) {
                    
                    Text("Profile")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .bold()
                        .foregroundStyle(.white)
                        .padding(.leading)
                    
                    
                    CircularProfileView()
                        .padding(.leading)
                    
                    VStack(alignment: .leading, spacing: 12) {
                        Text("Elvis Rexha")
                            .font(.headline)

                        Text("Current Enrolled Courses")
                            .font(.title)
                            
                            

                    }
                    .padding(.leading)
                    
                    
                }
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                
                if homeViewModel.enrolledCourses.isEmpty {
                    
                    VStack {
                        Image("empty-box")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80)
                        
                        Text("No courses enrolled\ncurrently")
                            .fontWeight(.bold)
                            .foregroundStyle(Color(.systemGray2))
                            .font(.title3)
                            .multilineTextAlignment(.center)
                            .padding(.top, 30)
                        
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    
                } else {
                    ScrollView {
                        ForEach(Array(homeViewModel.enrolledCourses.enumerated()), id: \.element) { (index, enrolledCourse) in
                            
                            HStack {
                                ZStack(alignment: .topLeading) {
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundStyle(.white)
                                    
                                    HStack(alignment: .bottom) {
                                        VStack(alignment: .leading) {
                                            HStack(alignment: .center) {
                                                Text(enrolledCourse.title)
                                                    .frame(width: 300, height: 30, alignment: .leading)
                                                
                                            }
                                            HStack {
                                                Image(systemName: "book.fill")
                                                
                                                Text("\(enrolledCourse.numberOfCourses) Courses")
                                            }
                                            
                                            
                                        }
                                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                                        
                                    }
                                    .foregroundStyle(.bg)
                                    .bold()
                                    .padding(.horizontal)
                                    
                                    
                                    
                                }
                                .gesture(
                                    profileViewModel.dragGesture()
                                )
                                
                                
                                .frame(width: UIScreen.main.bounds.width - 40 , height: 60)
                                
                                if profileViewModel.showDeleteButton {
                                    Button {
                                        withAnimation(.spring) {
                                            homeViewModel.deleteCourse(at: index)
                                        }
                                    } label: {
                                        HStack {
                                            
                                            Image(systemName: "trash")
                                                .fontWeight(.bold)
                                                .foregroundStyle(.red)
                                            
                                        }
                                    }
                                    .transition(.scale)
                                }
                            }
                            
                        }
                    }
                    .scrollIndicators(.hidden)
                }
                
                
            }
            .fontWeight(.bold)
            .foregroundStyle(.white)
            
        }
        
        
    }
    
}


#Preview {
    ProfileView()
        .environmentObject(HomeViewModel())
}

