//
//  DirectionTableCell.swift
//  Peachtree
//
//  Created by Anand on 11/09/22.
//

import UIKit

class DirectionTableCell: UITableViewCell {
    @IBOutlet weak var lblName: LBLSatoshiMediumBlack18!
    @IBOutlet weak var imgVw: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
