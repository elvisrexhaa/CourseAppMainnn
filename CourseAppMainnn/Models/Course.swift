//
//  Course.swift
//  CourseApp
//
//  Created by Elvis Rexha on 19/04/2024.
//

import Foundation


struct CachedData: Codable {
    var courses: [Course]
}

struct Course: Identifiable, Codable, Hashable, Equatable {
    
    var id = UUID()
    let title: String
    let overview: String
    let fullDescription: String
    let instructor: String
    let courseAvailable: Bool
    let numberOfCourses: Int
    let videos: [URL]
    let courseImage: String
    
}

extension Course {
    static func mockCourses() -> [Course] {
        return [
            Course(
                title: "Introduction to SwiftUI",
                overview: "Learn the basics of SwiftUI",
                fullDescription: "This comprehensive course covers the fundamentals of SwiftUI development, including SwiftUI layout, views, navigation, and data flow. Gain hands-on experience by building real-world SwiftUI applications.",
                instructor: "John Doe",
                courseAvailable: true,
                numberOfCourses: 2,
                videos: [
                    URLConstants.videoUrl(resource: "course1", withExtension: "mp4"),
                    URLConstants.videoUrl(resource: "course2", withExtension: "mp4")
                ], courseImage: "swiftuiIntro"
            ),
            Course(
                title: "Advanced iOS\nDevelopment",
                overview: "Take your iOS skills to the next level",
                fullDescription: "Take your iOS skills to the next level with this advanced course. Explore advanced topics in iOS development, including networking, Core Data, advanced UI/UX design, and integrating third-party libraries.",
                instructor: "Jane Smith",
                courseAvailable: true,
                numberOfCourses: 3,
                videos: [
                    URLConstants.videoUrl(resource: "advanced1", withExtension: "mp4"),
                    URLConstants.videoUrl(resource: "advanced2", withExtension: "mp4")
                ], courseImage: "advancedIOS"
            ),
            Course(
                title: "Data Science with Python",
                overview: "Master data science using Python",
                fullDescription: "Master data science concepts using Python programming language. Dive deep into data analysis, machine learning algorithms, data visualization techniques, and real-world data science projects.",
                instructor: "Alice Johnson",
                courseAvailable: true,
                numberOfCourses: 10,
                videos: [
                    URLConstants.videoUrl(resource: "data1", withExtension: "mp4"),
                    URLConstants.videoUrl(resource: "data2", withExtension: "mp4")
                ], courseImage: "python"
            ),
            Course(
                title: "Android App Development\nwith Kotlin",
                overview: "Build Android apps with Kotlin",
                fullDescription: "Learn how to develop feature-rich Android applications using the Kotlin programming language. Cover topics such as user interface design, data persistence, working with APIs, and deploying apps to the Google Play Store.",
                instructor: "Bob Johnson",
                courseAvailable: false,
                numberOfCourses: 21,
                videos: [
                ], courseImage: "kotlin"
            ),
            Course(
                title: "Web Development with\nReact",
                overview: "Learn modern web development with React",
                fullDescription: "Explore modern web development using the React JavaScript library. Master component-based architecture, state management with Redux, building single-page applications, and deploying web apps to production.",
                instructor: "Emily Brown",
                courseAvailable: false,
                numberOfCourses: 8,
                videos: [
                ], courseImage: "webDevelopment"
            ),
            Course(
                title: "Machine Learning\nFundamentals",
                overview: "Introduction to machine learning algorithms",
                fullDescription: "Get started with machine learning algorithms in this foundational course. Learn about supervised learning, unsupervised learning, model evaluation techniques, and practical machine learning applications.",
                instructor: "James Wilson",
                courseAvailable: true,
                numberOfCourses: 9,
                videos: [
                    URLConstants.videoUrl(resource: "machine1", withExtension: "mp4"),
                    URLConstants.videoUrl(resource: "machine2", withExtension: "mp4")
                ], courseImage: "machineLearning"
            ),
            Course(
                title: "Swift Programming\nLanguage",
                overview: "Master the Swift programming language",
                fullDescription: "Become proficient in the Swift programming language with this comprehensive course. Cover Swift syntax, data types, control flow, object-oriented programming principles, and best practices for iOS and macOS development.",
                instructor: "Sarah Johnson",
                courseAvailable: true,
                numberOfCourses: 14,
                videos: [
                    URLConstants.videoUrl(resource: "programming1", withExtension: "mp4"),
                    URLConstants.videoUrl(resource: "programming2", withExtension: "mp4")
                ], courseImage: "swiftProgramming"
            ),
            Course(
                title: "UX/UI Design\nFundamentals",
                overview: "Principles of user experience and user interface design",
                fullDescription:  "Explore the principles of user experience and user interface design. Learn about user research, wireframing, prototyping, usability testing, and designing intuitive and visually appealing digital products.",
                instructor: "Michael Brown",
                courseAvailable: false,
                numberOfCourses: 17,
                videos: [
                ], courseImage: "UIUX"
            ),
            Course(
                title: "Blockchain Basics",
                overview: "Introduction to blockchain technology",
                fullDescription: "Discover the fundamentals of blockchain technology, including decentralized systems, cryptographic principles, consensus mechanisms, and blockchain applications across various industries such as finance, supply chain, and healthcare.",
                instructor: "Emma Wilson",
                courseAvailable: true,
                numberOfCourses: 19,
                videos: [
                    URLConstants.videoUrl(resource: "blockchain1", withExtension: "mp4"),
                    URLConstants.videoUrl(resource: "blockchain2", withExtension: "mp4")
                ], courseImage: "blockchain"
            ),
            Course(
                title: "Cybersecurity Fundamentals",
                overview: "Essential concepts of cybersecurity",
                fullDescription: "Gain essential knowledge of cybersecurity concepts and practices. Cover network security, cryptography, threat detection, incident response, and best practices for securing digital assets against cyber threats.",
                instructor: "David Smith",
                courseAvailable: false,
                numberOfCourses: 26,
                videos: [
                ], courseImage: "cybersecurity"
            )
        ]
    }
}







