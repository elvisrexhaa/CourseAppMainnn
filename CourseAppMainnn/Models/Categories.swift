//
//  Categories.swift
//  CourseApp
//
//  Created by Elvis Rexha on 19/04/2024.
//

import Foundation


struct Category: Hashable {
    
    let courseTitle: String
    let symbol: String
    
    
    static var mockCategories: [Category] = [
    
        .init(courseTitle: "Development", symbol: "development"),
        .init(courseTitle: "Business", symbol: "business"),
        .init(courseTitle: "Design", symbol: "design"),
        .init(courseTitle: "Finance", symbol: "finance"),
        .init(courseTitle: "Office Productivity", symbol: "office")
    
    ]
    
}
