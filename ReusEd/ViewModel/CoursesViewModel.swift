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
            print("courses json file not found")
            return
        }
        
        let data = try? Data(contentsOf: url)
        let courses = try? JSONDecoder().decode([Course].self, from: data!)
        self.courses = courses!
        
    }
    
    func loadCategories() {
        guard let url = Bundle.main.url(forResource: "categories", withExtension: "json")
        else {
            print("categories json file not found")
            return
        }
        
        let data = try? Data(contentsOf: url)
        let categories = try? JSONDecoder().decode([Category].self, from: data!)
        self.categories = categories!
        
    }
    
    func loadLessons() {
        guard let url = Bundle.main.url(forResource: "lessons", withExtension: "json")
        else {
            print("lessons json file not found")
            return
        }
        
        let data = try? Data(contentsOf: url)
        let lessons = try? JSONDecoder().decode([Lesson].self, from: data!)
        self.lessons = lessons!
        
    }
    
    func getCoursesByCategory(categoryId: Int) -> [Course] {
        var coursesArr = [Course]()
        let coursesTemp = categories[categoryId - 1].courses
        for courseInd in coursesTemp {
            coursesArr.append(self.courses[courseInd-1])
        }
        
        return coursesArr
    }
    
    func getLessonsBySection(courseId: Int, sectionId: Int) -> [Lesson] {
        var lessonsArr = [Lesson]()
        let lessonsIds = courses[courseId - 1].sections[sectionId - 1].lessons
        for ind in lessonsIds {
            lessonsArr.append(self.lessons[ind - 1])
        }
        return lessonsArr
    }
    
    
    func updateLessonProgress(lessonId: Int, progress: Double) {
        DispatchQueue.main.async {
            if progress > 0.9 {
                self.lessons[lessonId - 1].progress = 1.0
            } else {
                self.lessons[lessonId - 1].progress = progress
            }
        }
    }
    
    func updateCourseProgress(courseId: Int) {
        let course = courses[courseId - 1]
        var courseProgress = 0.0
        var counter = 0
        for section in course.sections {
            let lessonInSection = getLessonsBySection(courseId: course.id, sectionId: section.id)
            for lesson in lessonInSection {
                courseProgress += lesson.progress
                counter += 1
            }
        }
        courses[courseId - 1].progress = courseProgress / Double(counter)
    }
    
}
