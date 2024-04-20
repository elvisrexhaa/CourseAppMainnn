//
//  HomeViewModel.swift
//  CourseApp
//
//  Created by Elvis Rexha on 19/04/2024.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var searchCourse: String = ""
    @Published var enrolledCourses: [Course]
    @Published var showAlert: Bool = false
    @Published var alertTitle: String = ""
    @Published var alertSubTitle: String = ""
    
    init() {
        if let savedCourses = UserDefaults.standard.data(forKey: "courses") {
            let decoder = JSONDecoder()
            if let decodedCourses = try? decoder.decode([Course].self, from: savedCourses) {
                self.enrolledCourses = decodedCourses
                return
            }
        }
        self.enrolledCourses = []
    }
    
    func enrollCourse(_ course: Course) {
        //append the course to the new array above...
        self.enrolledCourses.append(course)
        saveEnrolledCourses()
        showSuccessfulAlertX()
    }
    
    private func saveEnrolledCourses() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(enrolledCourses) {
            UserDefaults.standard.set(encoded, forKey: "courses")
        }
    }
    
    func deleteCourse(at index: Int) {
        enrolledCourses.remove(at: index)
        saveEnrolledCourses()
    }
    
    private func showSuccessfulAlertX() {
        showAlert = true
        alertTitle = "Succesfully Enrolled"
        alertSubTitle = "Course enrolled, please check your profile to view them"
    }
    

}
