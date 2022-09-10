//
//  RestaurantsVC.swift
//  Peachtree
//
//  Created by Anand on 10/09/22.
//

import UIKit

class RestaurantsVC: UIViewController {
    @IBOutlet weak var tblVwRestaurants: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerNib()
    }
    
    private func registerNib() {
        self.tblVwRestaurants.register(RestaurantsTableCell.self)
    }
    
    @IBAction func backTaped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension RestaurantsVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblVwRestaurants.dequeueReusableCell(withIdentifier: RestaurantsTableCell.className, for: indexPath) as! RestaurantsTableCell
        /*
        cell.vwBg.addRoundedViewCorners(width: 8, colorBorder: .clear, BackgroundColor: Colors.color_AppOrange!)
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
         */
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
