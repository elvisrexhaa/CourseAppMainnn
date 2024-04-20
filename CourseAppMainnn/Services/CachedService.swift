//
//  CachedService.swift
//  CourseApp
//
//  Created by Elvis Rexha on 20/04/2024.
//

import Foundation


//MARK: stores course data into cache

class CachedService {
    
    static let shared = CachedService()
    
    func saveData(_ data: CachedData) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(data) {
            UserDefaults.standard.set(encoded, forKey: "cachedData")
        }
    }
    
    func loadData() -> CachedData? {
        if let savedData = UserDefaults.standard.data(forKey: "cachedData") {
            let decoder = JSONDecoder()
            if let loadedData = try? decoder.decode(CachedData.self, from: savedData) {
                return loadedData
            }
        }
        return nil
    }
    
    
}
