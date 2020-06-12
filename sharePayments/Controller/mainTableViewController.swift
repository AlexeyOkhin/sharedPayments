//
//  mainTableViewController.swift
//  sharePayments
//
//  Created by Alexey on 06.06.2020.
//  Copyright © 2020 Alexey Okhin. All rights reserved.
//

import UIKit

class mainTableViewController: UITableViewController {
    
    var eventsArray = [Event(name: "командировка Орск", date: "12.05.2020")]

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue){
        guard segue.identifier == "unwindSave" else { return }
        let sourceEventVC = segue.source as! addEventViewController
        let newIndexPath = IndexPath(row: eventsArray.count, section: 0)
        eventsArray.append(sourceEventVC.event)
        self.tableView.insertRows(at: [newIndexPath], with: .fade)
       
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return eventsArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath) as! EventTableViewCell

        let object = eventsArray[indexPath.row]
        cell.set(object: object)

        return cell
    }
    

    
}
