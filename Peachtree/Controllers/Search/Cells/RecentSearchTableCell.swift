//
//  RecentSearchTableCell.swift
//  Peachtree
//
//  Created by Anand on 11/09/22.
//

import UIKit

class RecentSearchTableCell: UITableViewCell {
    @IBOutlet weak var vwBg: UIView!
    @IBOutlet weak var vwBgForImg: UIView!
    @IBOutlet weak var lblRecentSearch: LBSatoshiBoldLightGrey14!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
