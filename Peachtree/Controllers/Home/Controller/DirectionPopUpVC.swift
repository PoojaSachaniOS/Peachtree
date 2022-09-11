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

    var arr: [DirectionTableItem<DirectionTableItemType>] = []

    enum DirectionTableItemType {
        case golfCart, biCycle, walking
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vwBg.addRoundedViewCorners(width: 16, colorBorder: .clear, BackgroundColor: .white)
        self.registerNib()
        self.initializeData()
    }
    
    private func registerNib() {
        self.tblVwDirections.register(DirectionTableCell.self)
    }
    
    private func initializeData() {
        arr.append(DirectionTableItem(iconName: "imgGolfCart", title:"Direction by Golf Cart", type: .golfCart))
        arr.append(DirectionTableItem(iconName: "imgBicyles", title:"Direction by Bicycles", type: .biCycle))
        arr.append(DirectionTableItem(iconName: "imgWalking", title:"Walking", type: .walking))
    }
  
}

extension DirectionPopUpVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblVwDirections.dequeueReusableCell(withIdentifier: DirectionTableCell.className, for: indexPath) as! DirectionTableCell
        cell.backgroundColor = .clear
        let model = arr[indexPath.row]
        cell.lblName.text = model.title
        cell.imgVw.image = UIImage.init(named: model.iconName!)
        return cell
    }
   
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //self.openRestaurantsDetails()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 66
    }
}

class DirectionTableItem<T> {
    var iconName: String?
    var title: String?
    var type: T?
    
    init(iconName: String?, title: String?, type: T?) {
        self.iconName = iconName
        self.title = title
        self.type = type
    }
}
