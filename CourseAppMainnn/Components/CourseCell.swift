//
//  CourseCell.swift
//  CourseApp
//
//  Created by Elvis Rexha on 19/04/2024.
//

import SwiftUI

struct CourseHeader: View {
    
    let course: Course
    
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text(course.title)
                .font(.title2)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            
            Group {
                Text(course.instructor)
                
                
                Text(course.overview)
            }
            .font(.subheadline)
            .foregroundStyle(Color(.systemGray4))
            
            
            
            
        }
        .foregroundStyle(.white)
        .frame(width: 220, alignment: .leading)
        .background(LinearGradient(colors: [.black.opacity(0.1), .black.opacity(0.1), .black.opacity(0.1), .black.opacity(0.1), .black.opacity(0)], startPoint: .top, endPoint: .bottom))
        .foregroundStyle(.white)
        .padding(.leading, 2)
        
        
    }
}

#Preview {
    ZStack {
        Color.bg.ignoresSafeArea()
        CourseHeader(course: Course.mockCourses()[4])
    }
}


struct CourseCell: View {
    
    let course: Course
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image(course.courseImage)
                       .resizable()
                       .aspectRatio(contentMode: .fill)
                       .frame(width: 240, height: 300)
                       .clipShape(RoundedRectangle(cornerRadius: 10))
                   
            CourseHeader(course: course)
                       .padding(4)
                       
               }
               .overlay(alignment: .topTrailing) {
                   Circle()
                       .frame(width: 20, height: 20)
                       .foregroundStyle(course.courseAvailable ? .green : .red)
                       .shadow(color: .white, radius: 4)
                       .padding()
               }
               .overlay {
                   if !course.courseAvailable {
                       RoundedRectangle(cornerRadius: 10)
                           .foregroundStyle(.black.opacity(0.9))
                       
                       Text("Course Unavailable")
                           .foregroundStyle(.white)
                           .fontWeight(.semibold)
                           .font(.headline)
                   }
               }
               .disabled(course.courseAvailable) // Disable interaction if course is unavailable
           }
       }
        

#Preview {
    ZStack {
        Color.bg.ignoresSafeArea()
        CourseCell(course: Course.mockCourses()[4])
        
    }
}

