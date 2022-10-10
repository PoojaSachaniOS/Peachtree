//
//  RestaurantsTableCell.swift
//  Peachtree
//
//  Created by Anand on 10/09/22.
//

import UIKit
import Kingfisher

class RestaurantsTableCell: UITableViewCell {
    @IBOutlet weak var vwBg: UIView!

    @IBOutlet weak var imgVwOuter: AnimatedImageView!
    @IBOutlet weak var lblName: LBSatoshiMediumBlack14!
    @IBOutlet weak var lblAddress: LBSatoshiRegularLightGrey14!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        vwBg.addRoundedViewCorners(width: 6, colorBorder: (Colors.color_borderLightBlack!).withAlphaComponent(0.1), BackgroundColor: UIColor.white)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
