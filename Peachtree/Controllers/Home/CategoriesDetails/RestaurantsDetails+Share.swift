//
//  RestaurantsDetails+Share.swift
//  Peachtree
//
//  Created by Anand on 19/10/22.
//

import Foundation
import UIKit

extension RestaurantsDetailsVC {
    
     func configTapGestureForShare() {
        let tapGesOnDirection = UITapGestureRecognizer(target: self, action: #selector(self.handleShareTap(_:)))
        tapGesOnDirection.numberOfTapsRequired = 1
        vwBgShare.addGestureRecognizer(tapGesOnDirection)
    }
    
    @objc func handleShareTap(_ sender: Any?) {
        self.openShareAddressActivity()
    }
    
     func openShareAddressActivity() {
        if let address = lblAddress.text, !address.isEmpty {
            let activityViewController: UIActivityViewController = UIActivityViewController(activityItems: [address], applicationActivities:nil)
            activityViewController.popoverPresentationController?.sourceView = self.view
            activityViewController.excludedActivityTypes = [.print, .copyToPasteboard, .assignToContact, .saveToCameraRoll, .airDrop]
            
            DispatchQueue.main.async {
                self.present(activityViewController, animated: true, completion: nil);
            }
        }
       
    }
}
