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
        textColor = UIColor.white
        if UIDevice.current.userInterfaceIdiom == .pad {
            font = FontHelper.satoshiMediumFontWithSize(size: 22)
            return
        }
        font = FontHelper.satoshiMediumFontWithSize(size: 16)
    }
}
