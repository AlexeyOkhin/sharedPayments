//
//  addMemberViewController.swift
//  sharePayments
//
//  Created by Alexey on 08.06.2020.
//  Copyright © 2020 Alexey Okhin. All rights reserved.
//

import UIKit

class addMemberViewController: UIViewController {
    
    @IBOutlet weak var nameMemberTextField: UITextField!
    @IBOutlet weak var payMemberTextField: UITextField!
    @IBOutlet weak var doneButton: UIBarButtonItem!
    
    var member = Member(name: "", payment: 0)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameMemberTextField.text = member.name
        payMemberTextField.text = String(member.payment)
        doneButton.isEnabled = false

        
    }
    
    @IBAction func nameMemberAction(_ sender: UITextField) {
        
        if (sender.text?.isEmpty)! {
            doneButton.isEnabled = false
        } else {
            doneButton.isEnabled = true
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "unwindDone" else { return }
        let name = nameMemberTextField.text ?? ""
        let pay = Int(payMemberTextField.text!)! 
        
        self.member = Member(name: name, payment: pay)
    }
   

}
