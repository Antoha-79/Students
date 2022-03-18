//
//  Course+CoreDataProperties.swift
//  Dovnar-Students-CoreData
//
//  Created by Anton Dovnar on 3.02.22.
//
//

import Foundation
import CoreData


extension Course {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Course> {
        return NSFetchRequest<Course>(entityName: "Course")
    }

    @NSManaged public var name: String?
    @NSManaged public var info: String?
    @NSManaged public var students: NSSet?

}

// MARK: Generated accessors for students
extension Course {

    @objc(addStudentsObject:)
    @NSManaged public func addToStudents(_ value: Student)

    @objc(removeStudentsObject:)
    @NSManaged public func removeFromStudents(_ value: Student)

    @objc(addStudents:)
    @NSManaged public func addToStudents(_ values: NSSet)

    @objc(removeStudents:)
    @NSManaged public func removeFromStudents(_ values: NSSet)

}

extension Course : Identifiable {

}
