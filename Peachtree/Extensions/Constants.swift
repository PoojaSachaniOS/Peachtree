

import Foundation
import UIKit

class Constants {
    
    struct AppRootFlow {
        static let kEnterHome = "EnterHome"
        static let kGetStarted = "Welcome"
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
}

enum MoreType {
    case share, faq, aboutUs, contactUs, disclaimer, appVersion, notificationList, rateUs
}
