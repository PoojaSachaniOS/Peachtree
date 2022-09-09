//
//  MoreListTableVWCell.swift
//  PeachTree
//
//  Created by Pooja Softradix on 29/08/22.
//

import UIKit

class MoreListTableVWCell: UITableViewCell {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var backVw: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        backVw.layer.cornerRadius = 10
        backVw.dropShadowOnTableViewCell(color: UIColor.black.withAlphaComponent(0.1))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
