//
//  ImageConstants.swift
//  CourseApp
//
//  Created by Elvis Rexha on 19/04/2024.
//

import Foundation


struct ImageConstants {
    
    static var CourseImage: String = "courseImage2"
}


struct URLConstants {
    
    static func videoUrl(resource: String, withExtension: String) -> URL {
        return Bundle.main.url(forResource: resource, withExtension: withExtension)!
    }
    
    
}
