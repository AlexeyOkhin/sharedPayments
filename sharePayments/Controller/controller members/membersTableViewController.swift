//
//  membersTableViewController.swift
//  sharePayments
//
//  Created by Alexey on 08.06.2020.
//  Copyright © 2020 Alexey Okhin. All rights reserved.
//

import UIKit

class membersTableViewController: UITableViewController {
    
    var membersArray = [Member]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    @IBAction func unwindSegueMember(segue: UIStoryboardSegue){
        guard segue.identifier == "unwindDone" else { return }
        
        let sourceMemberVC = segue.source as! addMemberViewController
        
        
        let newIndexPath = IndexPath(row: membersArray.count, section: 0)
        membersArray.append(sourceMemberVC.member)
       
        
        self.tableView.insertRows(at: [newIndexPath], with: .fade)
        
    }
    
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return membersArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "memberCell", for: indexPath) as! MembersTableViewCell
       
        let object = membersArray[indexPath.row]
        cell.set(object: object)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Удалить") { (_, indexPath) in
            self.membersArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        
        
        
        return [deleteAction]
    }
    
    
}
