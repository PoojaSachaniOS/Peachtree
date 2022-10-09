

import Foundation
import UIKit

class Constants {
    
    struct AppRootFlow {
        static let kEnterHome = "EnterHome"
        static let kGetStarted = "Welcome"
        static let kTermsCondition = "Terms"

    }
    
    struct Array {
        static var moreArray = [MoreItem(iconName: "share_icon", title: "Share", type: MoreType.share),
                                MoreItem(iconName: "faq_icon", title: "FAQ", type: MoreType.faq),
                                MoreItem(iconName: "info_icon", title: "About Us", type: MoreType.aboutUs),
                                MoreItem(iconName: "contact_us_icon", title: "Contact Us", type: MoreType.contactUs),
                                MoreItem(iconName: "disclaimer_icon", title: "Disclaimer", type: MoreType.disclaimer),
                                MoreItem(iconName: "app_version_icon", title: "App Version", type: MoreType.appVersion),
                                MoreItem(iconName: "notification_list_icon", title: "Notification List", type: MoreType.notificationList),
                                MoreItem(iconName: "rate_us_icon", title: "Rate Us", type: MoreType.rateUs)]
        
    }
    
    struct UserDefault {
        struct Key {
            static let kAccessToken = "accessToken"
            static let kAcceptedTerms = "acceptedTerms"
        }
    }
    
    struct AppApiKeys {
        static let kOpenWeatherMapApiKey = "a7bbbd5e82c675f805e7ae084f742024"
    }
    
    enum APIResponseCodes: Int {
        case statusCodeSuccessful = 200
        case statusCodeNoContentSuccessful = 204
        case statusCodeInternalServerError = 500
        case success = 1
    }
    
    struct ValidationMessages {
        static let internetAppearOffline = "No internet connection."
    }
}

enum MoreType {
    case share, faq, aboutUs, contactUs, disclaimer, appVersion, notificationList, rateUs
}
