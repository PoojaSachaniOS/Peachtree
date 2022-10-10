//
//  RestaurantsVM.swift
//  Peachtree
//
//  Created by Anand on 09/10/22.
//

import Foundation
import ObjectMapper
import CoreLocation

class RestaurantsVM: NSObject {
    var vc: RestaurantsVC?
    var aryRestaurantsModel = [RestaurantsModel]()
    
    override init() {
        super.init()
        vc = RestaurantsVC()
    }

    func fetchNearByRestaurants(searchText:String?,latitude:Double,longitude:Double,offset:Int,callBack: ((_ errMsg: String,_ success: Bool) -> Void)!) {
        
        let urlPathNearByRestaurants:String! =  "\("https://api.yelp.com/v3/businesses/search?latitude=")\(latitude)\("&longitude=")\(longitude)\("&sort_by=")\("distance")\("&limit=")\("50")\("&offset=")\(offset)\("&radius=40000&term=")\(String(describing: searchText!))"
                
        ApiService.sendRequestForYelp(urlPath: urlPathNearByRestaurants, type: .get, parms: [:]) { response,suces in
            print("here is response", response)
            
            if let data = response["businesses"] as? [[String:AnyObject]] {
                let model : [RestaurantsModel] = Mapper<RestaurantsModel>().mapArray(JSONObject: data) ?? []
                self.aryRestaurantsModel.append(contentsOf: model)
            }
            callBack("Successfully", true)
        } faliure: { errMsg, errCode in
            callBack(errMsg, false)
        }
    }
    
    func fetchRestaurants() {
        LocationManager.shared.getLocation { (location:CLLocation?, error:NSError?) in
            if let error = error {
                self.alertMessage(message: error.localizedDescription, buttonText: "OK", completionHandler: nil)
                return
            }
            guard let location = location else {
                self.alertMessage(message: "Unable to fetch location", buttonText: "OK", completionHandler: nil)
                return
            }
        self.fetchRestaurants(searchText: "Restaurants", latitude: (location.coordinate.latitude), longitude: (location.coordinate.longitude))
        }
    }
    
    fileprivate func fetchRestaurants(searchText:String,latitude:Double,longitude:Double) {
        ProgressIndicator.shared().show( at: (self.vc?.view)!)
        self.fetchNearByRestaurants(searchText: searchText, latitude: latitude, longitude: longitude, offset: 0) { [weak self] errMsg, success in
            guard let strongSelf = self else { return }
            ProgressIndicator.shared().hide(at: self?.vc?.view ?? UIView())
            if success {
                print("here is success")
                if strongSelf.aryRestaurantsModel.count > 0 {
                  //  strongSelf.offset += 50 //For pagination
                    if let viewController = strongSelf.vc {
                        viewController.tblVwRestaurants.reloadData()
                    }
                }
            }
        }
    }

    func alertMessage(message:String,buttonText:String,completionHandler:(()->())?) {
        let alert = UIAlertController(title: "Location", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: buttonText, style: .default) { (action:UIAlertAction) in
            completionHandler?()
        }
        alert.addAction(action)
        if let viewcontroller = vc {
            viewcontroller.present(alert, animated: true, completion: nil)
        }
    }
}

