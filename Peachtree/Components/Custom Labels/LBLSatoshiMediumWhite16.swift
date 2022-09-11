//
//  LBLSatoshiMediumWhite16.swift
//  Peachtree
//
//  Created by Anand on 11/09/22.
//

import Foundation
import UIKit

class LBLSatoshiMediumWhite16: UILabel {

    override func layoutSubviews() {
        super.layoutSubviews()
        updateView()
    }
    
    func updateView() {
        font = FontHelper.satoshiMediumFontWithSize(size: 16)
        textColor = UIColor.white
    }
}
