//
//  RestaurantsModel.swift
//  Peachtree
//
//  Created by Anand on 09/10/22.
//

import Foundation
import ObjectMapper

struct RestaurantsBaseModal : Mappable {
    var businesses : [RestaurantsModel]?
    var total : Int?
    var region : Region?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        businesses <- map["businesses"]
        total <- map["total"]
        region <- map["region"]
    }

}


struct RestaurantsModel : Mappable {
    var id : String?
    var alias : String?
    var name : String?
    var image_url : String?
    var is_closed : Bool?
    var url : String?
    var review_count : Int?
    var categories : [Categories]?
    var rating : Int?
    var coordinates : Coordinates?
    var transactions : [String]?
    var price : String?
    var location : Location?
    var phone : String?
    var display_phone : String?
    var distance : Double?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        id <- map["id"]
        alias <- map["alias"]
        name <- map["name"]
        image_url <- map["image_url"]
        is_closed <- map["is_closed"]
        url <- map["url"]
        review_count <- map["review_count"]
        categories <- map["categories"]
        rating <- map["rating"]
        coordinates <- map["coordinates"]
        transactions <- map["transactions"]
        price <- map["price"]
        location <- map["location"]
        phone <- map["phone"]
        display_phone <- map["display_phone"]
        distance <- map["distance"]
    }

}

struct Categories : Mappable {
    var alias : String?
    var title : String?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        alias <- map["alias"]
        title <- map["title"]
    }

}

struct Coordinates : Mappable {
    var latitude : Double?
    var longitude : Double?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        latitude <- map["latitude"]
        longitude <- map["longitude"]
    }

}
struct Location : Mappable {
    var address1 : String?
    var address2 : String?
    var address3 : String?
    var city : String?
    var zip_code : String?
    var country : String?
    var state : String?
    var display_address : [String]?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        address1 <- map["address1"]
        address2 <- map["address2"]
        address3 <- map["address3"]
        city <- map["city"]
        zip_code <- map["zip_code"]
        country <- map["country"]
        state <- map["state"]
        display_address <- map["display_address"]
    }

}


struct Region : Mappable {
    var center : Center?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        center <- map["center"]
    }

}

struct Center : Mappable {
    var longitude : Double?
    var latitude : Double?

    init?(map: Map) {

    }

    mutating func mapping(map: Map) {

        longitude <- map["longitude"]
        latitude <- map["latitude"]
    }

}
