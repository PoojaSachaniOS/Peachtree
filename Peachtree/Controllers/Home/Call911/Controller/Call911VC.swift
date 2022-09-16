//
//  Call911VC.swift
//  Peachtree
//
//  Created by Anand on 10/09/22.
//

import UIKit

class Call911VC: CustomBaseVC {
    // MARK: - IB-OUTLET(S)
    @IBOutlet weak var tblVw: UITableView!
    
    // MARK: - View Loading -
    override func viewDidLoad() {
        super.viewDidLoad()
        super.setupLeftBarButtonItem()
        self.registerNib()
        self.navigationItem.title = "Call 911"
        self.setNeedsStatusBarAppearanceUpdate()
    }
    
    // MARK: - OVERRIDE METHOD(S)
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    //  MARK: - PRIVATE METHOD(S)
    private func registerNib() {
        self.tblVw.register(CallTableCell.self)
    }
}

// MARK: - UITableViewDataSource & Delegate(S)
extension Call911VC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblVw.dequeueReusableCell(withIdentifier: CallTableCell.className, for: indexPath) as! CallTableCell
       // cell.lblName.text = constant.Array.callArr[indexPath.row]
        cell.vwBg.addRoundedViewCorners(width: 8, colorBorder: .clear, BackgroundColor: Colors.color_AppOrange!)
        cell.vwBgContainer.addRoundedViewCorners(width: 4, colorBorder: (Colors.color_AppOrange!).withAlphaComponent(0.1), BackgroundColor: (UIColor.white.withAlphaComponent(0.20)))
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
