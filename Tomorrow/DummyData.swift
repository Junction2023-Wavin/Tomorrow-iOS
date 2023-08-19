//
//  DummyData.swift
//  Tomorrow
//
//  Created by 이안진 on 2023/08/19.
//

import Foundation

struct DummyData: Hashable {
    static let completedProcess: [Process] = [
        Process(present: 6, total: 24, title: "English Study", image: "process1"),
        Process(present: 8, total: 28, title: "A dementia prevention project", image: "process2"),
        Process(present: 10, total: 18, title: "Korean Study", image: "processDefault")
    ]
    
    static let completedClass: [Class] = [
        Class(title: "A letter-finding program", description: "Target: Preschoolers", isFavorite: true),
        Class(title: "the basics of learning Chinese", description: "Target: welfare center user", isFavorite: true)
    ]
    
    static let homeProcess: [Process] = [
        Process(present: 6, total: 24, title: "English Study", image: "process1"),
        Process(present: 8, total: 28, title: "A dementia prevention project", image: "process2"),
        Process(present: 10, total: 18, title: "Korean Study", image: "processDefault")
    ]
    
    static let homeClass: [Class] = [
        Class(title: "Basic Korean Language Education", description: "Target: a multicultural child", isFavorite: true),
        Class(title: "Korean Language Learned by Play", description: "Target: low-income children", isFavorite: true)
    ]
    
    static let allClass: [Class] = [
        Class(title: "A dementia prevention program", description: "Target: An old man"),
        Class(title: "A letter-finding program", description: "Target: Preschoolers", isFavorite: true),
        Class(title: "Basic Korean Language Education", description: "Target: a multicultural child", isFavorite: true),
        Class(title: "Korean Language Learned by Play", description: "Target: low-income children", isFavorite: true),
        Class(title: "Korean traditional manners", description: "Target: a multicultural family"),
        Class(title: "the basics of learning Chinese", description: "Target: welfare center user", isFavorite: true)
    ]
    
    static let firstLectures: [Lecture] = [
        Lecture(image: "lecture1", title: "1. Improve Spatial perception", description: "This is a dementia prevention question."),
        Lecture(image: "lecture2", title: "2. Frontal lobe training", description: "Strengthening Cognition to Prevent..."),
        Lecture(image: "lecture3", title: "3. Emergency response", description: "a code of conduct"),
        Lecture(image: "lecture4", title: "4. Find the wrong picture", description: "brain training"),
        Lecture(image: "lecture5", title: "5. Dementia Prevention Act", description: "Taking care of patients"),
        Lecture(image: "lecture6", title: "6. Patient family tips", description: "How not to get hurt"),
        Lecture(image: "lecture7", title: "7. One-man memory training", description: "getting into a habit"),
        Lecture(image: "lecture8", title: "8. Young dementia", description: "mitigation of the initial outbreak"),
        Lecture(image: "lecture9", title: "9. Dementia Symptoms", description: "Action tips for each symptom"),
        Lecture(image: "lecture10", title: "10. A habit good for dementia", description: "getting into a habit")
    ]
    
    static let secondLectures: [Lecture] = [
        Lecture(image: "lectureA", title: "1. English for the first time", description: "Future-oriented civic education"),
        Lecture(image: "lectureB", title: "2. Dementia Memory Test", description: "How to prevent dementia"),
        Lecture(image: "lectureC", title: "3. It's okay to be different!", description: "Multicultural understanding"),
        Lecture(image: "lectureD", title: "4. Reading your mind", description: "Dementia symptom education"),
        Lecture(image: "lectureE", title: "5. The first step in Korean", description: "an international marriage"),
        Lecture(image: "lectureF", title: "6. lower grades of math", description: "education for low-income students"),
        Lecture(image: "lectureG", title: "7. Trend Travel English", description: "making a free trip"),
        Lecture(image: "lectureH", title: "8. Making a Flexible Brain", description: "a children's creativity class"),
        Lecture(image: "lectureI", title: "9. Learning words", description: "over and over again"),
        Lecture(image: "lectureJ", title: "10. first step in Japanese", description: "There is no age for learning")
    ]
    
    static let englishLectures: [Lecture] = [
        Lecture(image: "peach", title: "1. Words for beginner", description: "A to Z"),
        Lecture(image: "book", title: "2. Be verbe", description: "How to use be verbe"),
        Lecture(image: "clock", title: "3. Objects", description: "Words in daily life"),
        Lecture(image: "megaphone", title: "4. A greeting message 1", description: "Greetings to people"),
        Lecture(image: "megaphone", title: "5. A greeting message 2", description: "A greeting at the first meeting"),
        Lecture(image: "megaphone", title: "6. A greeting message 3", description: "A greeting at the second meeting"),
        Lecture(image: "airplane", title: "7. Trend Travel English", description: "making a free trip"),
        Lecture(image: "airplane", title: "8. Travel", description: "Introduce myself")
    ]
}

struct Process {
    let present, total: Int
    let title, image: String
}

struct Class {
    let title, description: String
    var isFavorite: Bool = false
}

struct Lecture {
    let image, title, description: String
}
