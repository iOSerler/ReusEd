//
//  CoursesViewModel.swift
//  ReusEd
//
//  Created by Anna Dluzhinskaya on 14.06.2022.
//

import Foundation

class CoursesViewModel: ObservableObject {
    @Published var courses = [Course]()
    @Published var categories = [Category]()
    @Published var lessons = [Lesson]()
    
    
    init() {
        loadCourses()
        loadCategories()
        loadLessons()
    }
    
    func loadCourses() {
        guard let url = Bundle.main.url(forResource: "courses", withExtension: "json")
        else {
            print("Json file not found")
            return
        }
        
        let data = try? Data(contentsOf: url)
        let courses = try? JSONDecoder().decode([Course].self, from: data!)
        self.courses = courses!
        
    }
    
    func loadCategories() {
        guard let url = Bundle.main.url(forResource: "categories", withExtension: "json")
        else {
            print("Json file not found")
            return
        }
        
        let data = try? Data(contentsOf: url)
        let categories = try? JSONDecoder().decode([Category].self, from: data!)
        self.categories = categories!
        
    }
    
    func loadLessons() {
        guard let url = Bundle.main.url(forResource: "lessons", withExtension: "json")
        else {
            print("Json file not found")
            return
        }
        
        let data = try? Data(contentsOf: url)
        let lessons = try? JSONDecoder().decode([Lesson].self, from: data!)
        self.lessons = lessons!
        
    }
    
    func getCoursesByCategory(categoryId: Int) -> [Course] {
        var coursesArr = [Course]()
        
        if let coursesTemp = categories[categoryId - 1].courses {
            for courseInd in coursesTemp {
                coursesArr.append(self.courses[courseInd-1])
            }
        }
        
        return coursesArr
    }
    
    func getLessonsBySection(courseId: Int, sectionId: Int) -> [Lesson] {
        var lessonsArr = [Lesson]()
        let lessonsIds = courses[courseId - 1].sections![sectionId - 1].lessons
        for ind in lessonsIds {
            lessonsArr.append(self.lessons[ind - 1])
        }
        
        return lessonsArr
    }
    
}
