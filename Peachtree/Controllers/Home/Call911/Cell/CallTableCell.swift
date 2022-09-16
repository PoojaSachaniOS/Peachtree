//
//  CallTableVWCell.swift
//  PeachTree
//
//  Created by Pooja Softradix on 31/08/22.
//

import UIKit

class CallTableCell : UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var vwBg: UIView!
    @IBOutlet weak var vwBgContainer: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
