//
//  Commit+CoreDataClass.swift
//  GitCommit2
//
//  Created by Matt Kwiecien on 10/3/20.
//
//

import Foundation
import CoreData

@objc(Commit)
public class Commit: NSManagedObject {
    override init(entity:NSEntityDescription, insertInto context:NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
        print("Init called!")
    }
}
