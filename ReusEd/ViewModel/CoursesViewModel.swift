//
//  CoursesViewModel.swift
//  ReusEd
//
//  Created by Anna Dluzhinskaya on 14.06.2022.
//

import Foundation

class CoursesViewModel: ObservableObject {
    @Published var courses: [Course]
    @Published var categories: [Category]
    @Published var categoryCourses: [Int: [Int]]
    
    init(courses: [Course], categories: [Category], categoryCourses: [Int: [Int]]) {
        self.courses = courses
        self.categories = categories
        self.categoryCourses = categoryCourses
    }
    
    func getCoursesByCategory(
        categoryId: Int
    ) -> [Course] {
        var coursesArr = [Course]()
        
        if let coursesTemp = categoryCourses[categoryId] {
            for courseInd in coursesTemp {
                coursesArr.append(self.courses[courseInd-1])
            }
        }
        
        return coursesArr
    }

}
