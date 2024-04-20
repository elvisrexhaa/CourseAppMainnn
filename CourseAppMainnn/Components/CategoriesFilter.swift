//
//  CategoriesFilter.swift
//  CourseApp
//
//  Created by Elvis Rexha on 19/04/2024.
//

import SwiftUI

struct CategoriesFilter: View {
    
    @State private var selectedCategory: Category?
    
    
    var body: some View {
        
        ScrollView(.horizontal) {
            VStack(spacing: 12) {

                HStack {
                    ForEach(Category.mockCategories.prefix(3), id: \.self) { category in
                        CategoryCell(courseTitle: category.courseTitle, courseSymbolName: category.symbol)
                            
                            .onTapGesture {
                                withAnimation(.smooth) {
                                    selectedCategory = category
                                }
                            }
                            .offset(y: selectedCategory == category ? -6 : 0)
                            .scaleEffect(selectedCategory == category ? 1.1 : 1)
                            .animation(.smooth, value: selectedCategory == category)
                    }
                }
                .padding(.vertical, 10)
                

                HStack {
                    ForEach(Category.mockCategories.dropFirst(3), id: \.self) { category in
                        CategoryCell(courseTitle: category.courseTitle, courseSymbolName: category.symbol)
                            .onTapGesture {
                                selectedCategory = category
                            }
                            .offset(y: selectedCategory == category ? -6 : 0)
                            .scaleEffect(selectedCategory == category ? 1.1 : 1)
                            .animation(.smooth, value: selectedCategory == category)
                            
                    }
                }
                
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                
                
            }
            .padding(.horizontal)

        }
        
        
    }
}

#Preview {
    CategoriesFilter()
}



struct CategoryCell: View {
    
    var courseTitle: String = "Design"
    var courseSymbolName: String = "design"
    
    
    var body: some View {
        
        HStack {
            Image(courseSymbolName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20)
            
            Text(courseTitle)
                .fontWeight(.bold)
            
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 10)
        .background(.white, in: RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    CategoryCell()
}
