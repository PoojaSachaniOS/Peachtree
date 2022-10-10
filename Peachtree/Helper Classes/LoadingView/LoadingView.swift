//
//  LoadingView.swift
//  QuadWheels
//
//  Created by Jitendra on 02/08/18.
//  Copyright © 2018 Jitendra Gandhi. All rights reserved.
//

import UIKit

class LoadingView: UIView {

    // MARK: - IB Outlets
    @IBOutlet weak var lblStatus: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - View
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setup()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    // MARK: - Private Methods
    
    private func setup() {
        loadContentView()
        isHidden = true
      //  let activityIndicator = UIActivityIndicatorView()
        activityIndicator.color = UIColor.orange
        activityIndicator.hidesWhenStopped = true
    }

    // MARK: - Public Methods

    public func showMessage(_ message: String,
                            animateLoader: Bool,
                            autoHide after: TimeInterval? = nil) {
        
        self.isHidden = false
        
        lblStatus.text = message
        animateLoader ? activityIndicator.startAnimating() : activityIndicator.stopAnimating()
        
        if let timeInterval = after {
            DispatchQueue.main.asyncAfter(deadline: .now() + timeInterval) {
                self.hide()
            }
        }
    }
    
    public func hide() {
        self.isHidden = true
        lblStatus.text = nil
        activityIndicator.stopAnimating()
    }
}
