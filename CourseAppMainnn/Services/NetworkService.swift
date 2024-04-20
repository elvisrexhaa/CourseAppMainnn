//
//  NetworkService.swift
//  CourseApp
//
//  Created by Elvis Rexha on 20/04/2024.
//

import Foundation



enum APIError: Error {
    case invalidURL
    case decodingError(Error)
    
    var errorDescription: String {
        switch self {
        case .invalidURL:
            return "Invalid URL link, check and try again"
        case .decodingError(let error):
            return "Error decoding the following data: \(error.localizedDescription)"
        }
    }
    
}


class NetworkService {
    
    static let shared = NetworkService()
    
    //MARK: simulating data like mock service layer
    
    func fetchCourses() async throws -> [Course] {
        
        if let cachedData = CachedService.shared.loadData() {
            // Return courses from cache if available, if not then perform the network request below
            return cachedData.courses
        }

        //handle url
        guard let url = URL(string: "url goes here") else {
            throw APIError.invalidURL.errorDescription as! Error
        }
        
        let (data, _) = try await URLSession.shared.data(from: url) //as this is just a mock service layer i will not handle the additional errors.
        
        do {
            let courseData = try JSONDecoder().decode(CachedData.self, from: data)
            return courseData.courses
        } catch {
            throw APIError.decodingError(error)
        }
        
        
        
    }
    
}
