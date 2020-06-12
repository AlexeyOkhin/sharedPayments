//
//  addEventViewController.swift
//  sharePayments
//
//  Created by Alexey on 08.06.2020.
//  Copyright © 2020 Alexey Okhin. All rights reserved.
//

import UIKit

class addEventViewController: UIViewController {
    
    @IBOutlet weak var nameEventTextField: UITextField!
    @IBOutlet weak var dateEventTextField: UITextField!
    let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateEventTextField.inputView = datePicker
        datePicker.datePickerMode = .date
        let localeID = Locale.preferredLanguages.first
        datePicker.locale = Locale(identifier: "ru-Ru")
        getDateFromPicker()
        datePicker.addTarget(self, action: #selector(dateChange), for: .valueChanged)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureDone))
        self.view.addGestureRecognizer(tapGesture)
        
    }
    
    @objc func tapGestureDone () {
        view.endEditing(true)
    }
    
    @objc func dateChange () {
        getDateFromPicker()
       // view.endEditing(true)
    }
    
    
    func getDateFromPicker() {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy"
        dateEventTextField.text = formatter.string(from: datePicker.date)
    }
    

    

}
