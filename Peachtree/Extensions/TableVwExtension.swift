//
//  TableVwExtension.swift
//  Peachtree
//
//  Created by Apple on 15/10/22.
//

import Foundation
import UIKit

extension UITableView {
    func setEmptyMessage(_ message: String) {
        let mainView = UIView(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        let messageLabel = UILabel(frame: CGRect(x: mainView.frame.origin.x, y: mainView.frame.origin.y, width: mainView.frame.size.width, height: mainView.frame.size.height-150))
        messageLabel.text = message
        messageLabel.textColor = .black
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.font = UIFont(name: FontHelper.AppFont.fontSatoshiRegular, size: 20)
      //  messageLabel.sizeToFit()
        mainView.addSubview(messageLabel)
        self.backgroundView = mainView
        self.separatorStyle = .none
    }

    func restore() {
        self.backgroundView = nil
       // self.separatorStyle = .singleLine
    }
}
