//
//  ViewController.swift
//  GitCommit2
//
//  Created by Matt Kwiecien on 10/3/20.
//

import UIKit
import CoreData
import SwiftyJSON

class ViewController: UITableViewController {

    var container: NSPersistentContainer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let commit = Commit()
        commit.message = "Woo"
        commit.url = "http://www.example.com"
        commit.date = Date()
        
        //Create the container
        container = NSPersistentContainer(name: "GitCommit")
        //Creates or loads saved database
        container.loadPersistentStores { storeDescription, error in
            if let error = error {
                print("Unresolved error \(error)")
            }
        }
        performSelector(inBackground: #selector(fetchCommits), with: nil)

    }
    
    @objc func fetchCommits() {
        if let data = try? String(contentsOf: URL(string: "https://api.github.com/repos/apple/swift/commits?per_page=100")!) {
            let jsonCommits = JSON(parseJSON:data)
            let jsonCommitArray = jsonCommits.arrayValue
            print("Recieved \(jsonCommitArray.count) commits.")
            
            DispatchQueue.main.async { [unowned self] in
                for jsonCommit in jsonCommitArray{
                    let commit = Commit(context: self.container.viewContext)
                    self.configure(commit: commit, usingJSON: jsonCommit)
                }
                self.saveContext();
            }
        }
    }
    
    func configure(commit: Commit, usingJSON json: JSON){
        commit.sha = json["sha"].stringValue
        commit.message = json["commit"]["message"].stringValue
        commit.url = json["html_url"].stringValue
        let formatter = ISO8601DateFormatter()
        commit.date = formatter.date(from: json["commit"]["committer"]["date"].stringValue) ?? Date()
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

