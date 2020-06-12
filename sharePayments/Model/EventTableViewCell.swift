//
//  EventTableViewCell.swift
//  sharePayments
//
//  Created by Alexey on 10.06.2020.
//  Copyright © 2020 Alexey Okhin. All rights reserved.
//

import UIKit

class EventTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameEventLabel: UILabel!
    @IBOutlet weak var dateEventLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
            // Действие при нажатии на ячейку
        
    }
    
    func set(object: Event) {
        self.nameEventLabel.text = object.name
        self.dateEventLabel.text = object.date
    }

}
