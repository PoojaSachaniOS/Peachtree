//
//  DirectionPopUpVC.swift
//  Peachtree
//
//  Created by Anand on 11/09/22.
//

import UIKit

class DirectionPopUpVC: UIViewController {
    @IBOutlet weak var vwBg: UIView!
    @IBOutlet weak var tblVwDirections: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        vwBg.addRoundedViewCorners(width: 16, colorBorder: .clear, BackgroundColor: .white)
        self.registerNib()

    }
    
    private func registerNib() {
        self.tblVwDirections.register(DirectionTableCell.self)
    }
  
}

extension DirectionPopUpVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblVwDirections.dequeueReusableCell(withIdentifier: DirectionTableCell.className, for: indexPath) as! DirectionTableCell
        cell.backgroundColor = .clear
        return cell
    }
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //self.openRestaurantsDetails()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 66
    }
}
