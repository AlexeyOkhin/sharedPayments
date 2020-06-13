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
        self.title = "Событие"
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue){
        guard segue.identifier == "unwindSave" else { return }
        
        let sourceEventVC = segue.source as! addEventViewController
        
        if sourceEventVC.title == "Редактировать событие" {
            eventsArray[(sourceEventVC.indexPathRow?.row)!] = sourceEventVC.event
            tableView.reloadRows(at: [sourceEventVC.indexPathRow!], with: .fade)
        } else {
            let newIndexPath = IndexPath(row: eventsArray.count, section: 0)
            eventsArray.append(sourceEventVC.event)
            self.tableView.insertRows(at: [newIndexPath], with: .fade)
        }
        
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
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .insert
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .insert {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            guard let secondViewController = storyboard.instantiateViewController(withIdentifier: "addEventViewController") as? addEventViewController else { return }
            secondViewController.event = self.eventsArray[indexPath.row]
            secondViewController.title = "Редактировать событие"
            secondViewController.indexPathRow = indexPath
            show(secondViewController, sender: nil)
        }
    }
    
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Удалить") { (_, indexPath) in
            self.eventsArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
        let shareAction = UITableViewRowAction(style: .normal, title: "Поделиться") { (_, indexPath) in
            // code for share
        }
        shareAction.backgroundColor = UIColor.purple
        
        return [deleteAction, shareAction]
    }
    
    
    
}
