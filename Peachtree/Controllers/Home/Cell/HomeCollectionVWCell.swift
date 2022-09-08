//
//  HomeCollectionVWCell.swift
//  PeachTree
//
//  Created by Pooja Softradix on 01/09/22.
//

import UIKit

class HomeCollectionVWCell: UICollectionViewCell {

    @IBOutlet weak var backVw: UIView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imageVw: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        backVw.layer.cornerRadius = 10
    }

}
