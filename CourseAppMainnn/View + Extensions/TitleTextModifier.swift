//
//  TitleTextModifier.swift
//  CourseApp
//
//  Created by Elvis Rexha on 19/04/2024.
//

import Foundation
import SwiftUI


struct TitleTextModifier: ViewModifier {
    
    var color: Color
    
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            .fontWeight(.bold)
            .padding(.horizontal)
            .padding(.top)
            .foregroundStyle(color)
            
    }
}



extension View {
    
    func titleTextModifier(color: Color) -> some View {
        modifier(TitleTextModifier(color: color))
    }
    
}
