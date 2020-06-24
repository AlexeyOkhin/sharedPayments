//
//  MembersTableViewCell.swift
//  sharePayments
//
//  Created by Alexey on 13.06.2020.
//  Copyright © 2020 Alexey Okhin. All rights reserved.
//

import UIKit

class MembersTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameMemberLabel: UILabel!
    
    @IBOutlet weak var payMemberLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func set(object: Member) {
        self.nameMemberLabel.text = object.name
        self.payMemberLabel.text = String(object.payment)
    }

}
