//
//  membersTableViewController.swift
//  sharePayments
//
//  Created by Alexey on 08.06.2020.
//  Copyright © 2020 Alexey Okhin. All rights reserved.
//

import UIKit

class membersTableViewController: UITableViewController {
    
    @IBOutlet weak var resultLabel: UILabel!
    var membersArray = [Member]()
    
    weak var delegate: TabeleViewMemberDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        
    }
    
    @IBAction func unwindSegueMember(segue: UIStoryboardSegue){
        guard segue.identifier == "unwindDone" else { return }
        
        
        
        let sourceMemberVC = segue.source as! addMemberViewController
        
        
        let newIndexPath = IndexPath(row: membersArray.count, section: 0)
        membersArray.append(sourceMemberVC.member)
        delegate?.updateArrayMembers(member: sourceMemberVC.member)
        print(membersArray)
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
            self.delegate?.deleteArrayMembers(memberInt: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
     
        return [deleteAction]
    }
    
    // MARK: Action
    
    @IBAction func itogButtonAction(_ sender: UIBarButtonItem) {
        
        let totalPay = membersArray.reduce(0, { $0 + $1.payment })
        print (totalPay)
        
        let eqPay = (totalPay / membersArray.count)
        print(eqPay)
        
        let tmpArray = membersArray.map{ member in
            (member.name, eqPay - member.payment)
        }
        print (tmpArray)
        
        var debtorsArray = tmpArray.filter{name,pay in pay > 0}
        print (debtorsArray)
        
        var lendersArray = tmpArray.filter{name,pay in pay < 0}
        print (lendersArray)
        
        var lender = lendersArray[0]
        var debtor = debtorsArray[0]
        var values = [String]()
        var delta = 0
        
        while lendersArray.count > 0 && debtorsArray.count > 0 {
            if lender.1 == 0 {
                lender = lendersArray[0]
            }
            if debtor.1 == 0 {
                debtor = debtorsArray[0]
            }
            
            delta = debtor.1 + lender.1
            
            if (delta < 0) {
                values.append("Должник:\(debtor.0) отдает :\(lender.0) сумму :\(debtor.1)")
                lender.1 += debtor.1
                debtor.1 = 0
            } else {
                values.append("Должник:\(debtor.0) отдает :\(lender.0) сумму :\(-lender.1)")
                debtor.1 += lender.1
                lender.1 = 0
            }
            
            if (debtor.1 == 0) {
                debtorsArray.remove(at: 0)
                //debtor =
            }
            if (lender.1 == 0) {
                lendersArray.remove(at: 0)
                //lender = nil
            }
            
            delta = 0
        }
        
        resultLabel.text = ("""
            Общая сумма: \(totalPay)
            средний платеж = \(eqPay)
            расплата \(values)
            """)
          print(values)
          print(totalPay)
          print(eqPay)
        
    }
}
 
        

 
    
    

