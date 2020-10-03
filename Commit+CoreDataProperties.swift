//
//  Commit+CoreDataProperties.swift
//  GitCommit2
//
//  Created by Matt Kwiecien on 10/3/20.
//
//

import Foundation
import CoreData


extension Commit {
    
    @nonobjc public class func createFetchRequest() -> NSFetchRequest<Commit> {
        return NSFetchRequest<Commit>(entityName: "Commit")
    }

    @NSManaged public var date: Date
    @NSManaged public var message: String
    @NSManaged public var sha: String
    @NSManaged public var url: String

}

extension Commit : Identifiable {

}
