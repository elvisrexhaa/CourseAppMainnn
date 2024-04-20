//
//  CourseListView.swift
//  CourseApp
//
//  Created by Elvis Rexha on 19/04/2024.
//

import SwiftUI



struct HomeView: View {
    
    @EnvironmentObject var homeViewModel: HomeViewModel
    @Binding var hideTabBar: Bool
    
    @State private var cachedData: CachedData?

    var body: some View {
        
        NavigationStack {
            VStack {
                Header(searchCourse: $homeViewModel.searchCourse)

                ScrollView {
                    VStack(alignment: .leading) {
                        Text("List of Courses")
                            .titleTextModifier(color: .white)
                        
                        ZStack {
                            if let filterCoursesOnSearch {
                                if filterCoursesOnSearch.isEmpty {
                                    PlaceHolder()
                                }
                            }
                            
                            ScrollView(.horizontal) {
                                HStack {
                                    ForEach(filterCoursesOnSearch ?? Course.mockCourses()) { course in
                                        NavigationLink(value: course) {
                                            CourseCell(course: course)
                                                .allowsHitTesting(course.courseAvailable)
                                                
                                        }
                                        .buttonStyle(.plain)
                                    }
                                    .scrollTransition(transition: { content, phase in
                                            content
                                            .scaleEffect(phase.isIdentity ? 1 : 0.80)
                                            .rotation3DEffect(.degrees(phase.isIdentity ? 0 : 10), axis: (x: 0.0, y: 1.0, z: 0.0))
                                    })

                                }
                                .animation(.bouncy, value: homeViewModel.searchCourse)
                                .padding([.leading, .trailing])
                                
                            }
                            .scrollTargetLayout()
                            .scrollIndicators(.hidden)
                        }
                    }
                    
                    
                    VStack {
                        //categories go here...
                        Text("Categories")
                            .titleTextModifier(color: .white)
                        
                        CategoriesFilter()
                            .scrollIndicators(.hidden)
                            .padding(.top, 2)
                    }
                    
                }

            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
            .background(.bg)
            
            .navigationDestination(for: Course.self) { course in
                CourseDetailView(course: course, hideTabBar: $hideTabBar)
                    .navigationBarBackButtonHidden()
            }
            .onAppear {
                hideTabBar = false
                cachedData = CachedService.shared.loadData()
                
                
            }
            .onDisappear {
                if let cachedData = cachedData {
                    CachedService.shared.saveData(cachedData)
                }
            }
        }
        
    }
}

#Preview {
    HomeView(hideTabBar: .constant(false))
        .environmentObject(HomeViewModel())
}

struct Header: View {
    
    @Binding var searchCourse: String
    
    var body: some View {
        HStack {
            TextField(text: $searchCourse) {
                Text("Search Course")
                    .fontWeight(.bold)
                
            }
                
                if !searchCourse.isEmpty {
                    Image(systemName: "xmark")
                        .bold()
                        .foregroundStyle(.bg)
                        .padding(.trailing)
                        .opacity(!searchCourse.isEmpty ? 1: 0)
                        .symbolEffect(.bounce, options: .repeat(4), value: searchCourse)
                        .onTapGesture {
                            searchCourse = ""
                        }
                }
                
                    
                    
            
        }
        .padding(.leading)
        .frame(width: UIScreen.main.bounds.width - 40, height: 50)
        .background(Color(.systemGray6), in: RoundedRectangle(cornerRadius: 10))
        .padding(.top, 10)
    }
}

struct PlaceHolder: View {
    var body: some View {
        VStack(spacing: 12) {
            
            Image("empty")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
            
            Text("No course belongs to\nthis title")
                .fontWeight(.bold)
                .font(.headline)
                .foregroundStyle(Color(.systemGray5))
                .multilineTextAlignment(.center)
        }
        .frame(width: 300, height: 300)
        .background(Color.clear)
    }
}



extension HomeView {
    
    var filterCoursesOnSearch: [Course]? {
        
        homeViewModel.searchCourse.isEmpty ? cachedData?.courses : cachedData?.courses.filter({$0.title.contains(homeViewModel.searchCourse)})
        
    }
    
    
}
