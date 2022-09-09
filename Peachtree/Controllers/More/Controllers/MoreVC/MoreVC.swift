//
//  MoreVC.swift
//  PeachTree
//
//  Created by Pooja Softradix on 29/08/22.
//

import UIKit

class MoreVC: UIViewController {
    @IBOutlet weak var tableVw: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
       
        tableVw.register(MoreListTableVWCell.self)

        tableVw.separatorStyle = .none
    }
    
    @IBAction func backTaped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension MoreVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Constants.Array.moreArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableVw.deque(MoreListTableVWCell.self, at: indexPath)
        cell.lblName.text = Constants.Array.moreArray[indexPath.row].title
        cell.imgView.image = UIImage(named: Constants.Array.moreArray[indexPath.row].iconName ?? "")
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if Constants.Array.moreArray[indexPath.row].type == .share {
            if let controller = StoryboardUtils.getShareVC() as? ShareVC {
                self.navigationController?.pushViewController(controller, animated: true)
            }
        }  else if Constants.Array.moreArray[indexPath.row].type == .appVersion {
            if let controller = StoryboardUtils.getAppVersionVC() as? AppVersionVC {
                self.navigationController?.pushViewController(controller, animated: true)
            }
        }
    }
    
}
