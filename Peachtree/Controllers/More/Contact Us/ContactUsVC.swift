//
//  ContactUsVC.swift
//  Peachtree
//
//  Created by Pooja Softradix on 10/09/22.
//

import UIKit

struct ContactUsdetails {
    var title : String
    var subTitle : String
    var imgLogo : UIImage
}


class ContactUsVC: CustomBaseVC {
    
    @IBOutlet weak var tblVwContactUs: UITableView!
    var arrContactdetails : [ContactUsdetails] = []
    // MARK: - View Loading -
    override func viewDidLoad() {
        super.viewDidLoad()
        super.setupLeftBarButtonItem()
        self.setupUI()
        self.navigationItem.title = "Contact Us"
    }
    
    func setupUI() {
        let phoneDetails = ContactUsdetails(title: "Phone No.", subTitle: "+ 91 234 3456 234", imgLogo: UIImage(imageLiteralResourceName: "call_icon"))
        arrContactdetails.append(phoneDetails)
        
        let emailDetails = ContactUsdetails(title: "Email", subTitle: "ingo@gmail.com", imgLogo: UIImage(imageLiteralResourceName: "email_icon"))
        arrContactdetails.append(emailDetails)
        
        let websiteDetails = ContactUsdetails(title: "Website", subTitle: "www.app.com", imgLogo: UIImage(imageLiteralResourceName: "website_icon"))
        arrContactdetails.append(websiteDetails)
    }
}

extension ContactUsVC : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? ContactUsCell
        cell?.selectionStyle = .none
        cell?.lblTitle.text = self.arrContactdetails[indexPath.row].title
        cell?.lblSubTitle.text = self.arrContactdetails[indexPath.row].subTitle
        cell?.imgVwIcon.image = self.arrContactdetails[indexPath.row].imgLogo
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrContactdetails.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}


class ContactUsCell: UITableViewCell {
    @IBOutlet weak var lblTitle: LBSatoshiMediumBlack22!
    @IBOutlet weak var lblSubTitle: LBSatoshiRegularLightGrey12!
    @IBOutlet weak var imgVwIcon: UIImageView!
    
}
