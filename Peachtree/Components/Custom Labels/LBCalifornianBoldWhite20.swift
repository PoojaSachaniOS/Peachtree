//
//  LBCalifornianBoldWhite20.swift
//  Peachtree
//
//  Created by Pooja Softradix on 08/09/22.
//

import UIKit

class LBCalifornianBoldWhite20: UILabel {

    override func layoutSubviews() {
        super.layoutSubviews()
        updateView()
    }
    
    func updateView() {
        let size : CGFloat = 20.0
        font = FontHelper.californianBoldFontWithSize(size: (UIDevice.current.userInterfaceIdiom == .pad) ? size + 6.0 : size)
        textColor = UIColor.white
    }
}
