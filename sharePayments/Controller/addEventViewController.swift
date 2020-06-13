//
//  addEventViewController.swift
//  sharePayments
//
//  Created by Alexey on 08.06.2020.
//  Copyright © 2020 Alexey Okhin. All rights reserved.
//

import UIKit

class addEventViewController: UIViewController {
    
    var event = Event(name: "", date: "")
    
    @IBOutlet weak var nameEventTextField: UITextField!
    @IBOutlet weak var dateEventTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Добавить событие"
        saveButton.isEnabled = false
        dateEventTextField.inputView = datePicker
        datePicker.datePickerMode = .date
        //let localeID = Locale.preferredLanguages.first
        datePicker.locale = Locale(identifier: "ru-Ru")
        getDateFromPicker()
        datePicker.addTarget(self, action: #selector(dateChange), for: .valueChanged)
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureDone))
        self.view.addGestureRecognizer(tapGesture)
        
        
    }
    
    @IBAction func nameEventAction(_ sender: UITextField) {
        if (sender.text?.isEmpty)! {
            saveButton.isEnabled = false
        } else {
        saveButton.isEnabled = true
        }
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "unwindSave" else { return }
        let event = nameEventTextField.text ?? ""
        let date = dateEventTextField.text ?? ""
        
        self.event = Event(name: event, date: date)
    }

    

}
