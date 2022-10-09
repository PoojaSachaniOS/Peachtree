//
//  RestaurantsVM.swift
//  Peachtree
//
//  Created by Anand on 09/10/22.
//

import Foundation
import ObjectMapper

class RestaurantsVM: NSObject {
    var aryRestaurantsModel = [RestaurantsModel]()

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
}

