//
//  DetailViewController.swift
//  GitCommit2
//
//  Created by Matt Kwiecien on 10/3/20.
//

import UIKit

class DetailViewController: UIViewController {

    var detailItem: Commit?
    @IBOutlet var detailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let detail = self.detailItem {
            detailLabel.text = detail.message
//            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Commit 1/\(detail.author.commits.count)", style: .plain, target: self, action: #selector(showAuthorCommits))
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
