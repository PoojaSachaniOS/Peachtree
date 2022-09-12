//
//  Call911VC.swift
//  Peachtree
//
//  Created by Anand on 10/09/22.
//

import UIKit

class Call911VC: UIViewController {
    @IBOutlet weak var tblVw: UITableView!
    @IBOutlet weak var headerViewHeight: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerNib()
        self.setNeedsStatusBarAppearanceUpdate()
        if !(UIDevice.current.hasNotch)  {
            headerViewHeight.constant = 80
        }
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    private func registerNib() {
        self.tblVw.register(CallTableCell.self)
    }
    
    @IBAction func backTaped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

}

extension Call911VC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblVw.dequeueReusableCell(withIdentifier: CallTableCell.className, for: indexPath) as! CallTableCell
       // cell.lblName.text = constant.Array.callArr[indexPath.row]
        cell.vwBg.addRoundedViewCorners(width: 8, colorBorder: .clear, BackgroundColor: Colors.color_AppOrange!)
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
