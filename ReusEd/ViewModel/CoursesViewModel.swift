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
    
    func saveCourseProgress(userId: Int, courseId: Int) -> Double {
        var sum = 0.0
        var counter = 0
        let course = courses[courseId - 1]
        for section in course.sections {
            for lessonId in section.lessons {
                let progress = getLessonProgress(userId: userId, lessonId: lessonId)
                sum += progress
                counter += 1
            }
        }
        let key = "course_\(userId)_\(courseId)"
        UserDefaults.standard.set(sum / Double(counter), forKey: key)
        return sum / Double(counter)
    }
    
    
    func getCourseProgress(userId: Int, courseId: Int) -> Double {
        let key = "course_\(userId)_\(courseId)"
        let progress = UserDefaults.standard.value(forKey: key)
        if let progress = progress as? Double {
            return progress
        }
        return 0.0
    }
    
    func saveLessonProgress(userId: Int, lessonId: Int, progress: Double) {
        let key = "lesson_\(userId)_\(lessonId)"
        UserDefaults.standard.set(progress, forKey: key)
    }
    
    func getLessonProgress(userId: Int, lessonId: Int) -> Double {
        let key = "lesson_\(userId)_\(lessonId)"
        let progress = UserDefaults.standard.value(forKey: key) as? Double ?? 0.0
        return progress
    }
    
    func getQuizPoints(lessonId: Int) -> Int {
        let lesson = self.lessons[lessonId - 1]
        var count = 0
        
        if lesson.type == "quiz" || lesson.type == "finalQuiz"{
            for question in lesson.quizData!.quizQuestions {
                count += question.points
            }
            return count
        } else {
            return 0
        }
    }
    
    func getCourseNameFromId(courseId: Int) -> String {
        for course in courses where course.id == courseId {
            return course.title
        }
        return ""
    }
}
