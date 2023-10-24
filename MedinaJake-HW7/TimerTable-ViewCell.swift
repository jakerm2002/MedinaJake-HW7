//
//  TimerTable-ViewCell.swift
//  MedinaJake-HW7
//
//  Created by Jake Medina on 10/23/23.
//

import UIKit

class TimerTable_ViewCell: UITableViewCell {

    @IBOutlet weak var eventLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var remainingTimeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
