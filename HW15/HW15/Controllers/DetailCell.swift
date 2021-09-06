//
//  DetailCell.swift
//  HW15
//
//  Created by Powroli on 4.07.21.
//

import UIKit

class DetailCell: UITableViewCell {
    
    @IBOutlet weak var phoneLbl: UILabel!
    @IBOutlet weak var emailLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
