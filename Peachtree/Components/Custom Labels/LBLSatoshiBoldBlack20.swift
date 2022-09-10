//
//  LBLSatoshiBoldBlack18.swift
//  Peachtree
//
//  Created by Anand on 10/09/22.
//

import UIKit

class LBLSatoshiBoldBlack20: UILabel {

    override func layoutSubviews() {
        super.layoutSubviews()
        updateView()
    }
    
    func updateView() {
        font = FontHelper.defaultSatoshiBoldFontWithSize(size: 20)
        textColor = UIColor.black
    }

}
