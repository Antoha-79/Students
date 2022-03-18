//
//  Student+CoreDataProperties.swift
//  Dovnar-Students-CoreData
//
//  Created by Anton Dovnar on 3.02.22.
//
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var name: String?
    @NSManaged public var lastname: String?
    @NSManaged public var avrgScore: Double
    @NSManaged public var course: Course?

}

extension Student : Identifiable {

}
