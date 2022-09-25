//
//  LBCalifornianBoldWhite24.swift
//  Peachtree
//
//  Created by Pooja Softradix on 08/09/22.
//

import UIKit

class LBCalifornianBoldBlack24: UILabel {

    override func layoutSubviews() {
        super.layoutSubviews()
        updateView()
    }
    
    func updateView() {
        let size : CGFloat = 24.0
        font = FontHelper.californianBoldFontWithSize(size: (UIDevice.current.userInterfaceIdiom == .pad) ? size + 6.0 : size)
        textColor = UIColor.black
    }
}



