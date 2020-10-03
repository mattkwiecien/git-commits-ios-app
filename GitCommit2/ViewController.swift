//
//  ViewController.swift
//  GitCommit2
//
//  Created by Matt Kwiecien on 10/3/20.
//

import UIKit
import CoreData

class ViewController: UITableViewController {

    var container: NSPersistentContainer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Create the container
        container = NSPersistentContainer(name: "GitCommit")
        //Creates or loads saved database
        container.loadPersistentStores { storeDescription, error in
            if let error = error {
                print("Unresolved error \(error)")
            }
        }
        
    }
    
    func saveContext(){
        if container.viewContext.hasChanges{
            do {
                //If there are changes, save them from RAM to db
                try container.viewContext.save()
            } catch {
                print("An error occurred while saving: \(error)")
            }
        }
    }


}

