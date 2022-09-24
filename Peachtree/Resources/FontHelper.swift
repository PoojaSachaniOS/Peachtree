
import Foundation
import UIKit

struct FontHelper {
    
    static func satoshiRegularFontWithSize(size: CGFloat) -> UIFont {
        return UIFont(name: FontHelper.AppFont.californian_fontBold, size: isPad(size))!
    }
    
    static func satoshiMediumFontWithSize(size: CGFloat) -> UIFont {
        return UIFont(name: FontHelper.AppFont.fontMedium, size: isPad(size))!
    }
    
    static func satoshiBoldFontWithSize(size: CGFloat) -> UIFont {
        return UIFont(name: FontHelper.AppFont.californian_fontBold, size: isPad(size))!
    }
    
    static func defaultSatoshiBoldFontWithSize(size: CGFloat) -> UIFont {
        return UIFont(name: FontHelper.AppFont.fontSatoshiBold, size: isPad(size))!
    }

    static func defaultSatoshiRegularFontWithSize(size: CGFloat) -> UIFont {
        return UIFont(name: FontHelper.AppFont.fontSatoshiRegular, size: isPad(size))!
    }
    
    static func californianBoldFontWithSize(size: CGFloat) -> UIFont {
        return UIFont(name: FontHelper.AppFont.californian_fontBold, size: isPad(size))!
    }
    
    static func californianRegFontWithSize(size: CGFloat) -> UIFont {
        return UIFont(name: FontHelper.AppFont.californian_fontRegular, size: isPad(size))!
    }
    
    static func defaultSatoshiLightFontWithSize(size: CGFloat) -> UIFont {
        return UIFont(name: FontHelper.AppFont.fontSatoshiLight, size: isPad(size))!
    }
    
    static func defaultSatoshiMediumFontWithSize(size: CGFloat) -> UIFont {
        return UIFont(name: FontHelper.AppFont.fontMedium, size: isPad(size))!
    }
    
    static func isPad(_ size: CGFloat) -> CGFloat {
        if (UIDevice.current.userInterfaceIdiom == .pad) {
            return size + 6.0
        }
        return size
    }
    
    struct AppFont {
        static let fontSatoshiRegular = "Satoshi-Regular"
        static let fontMedium = "Satoshi-Medium"
        static let fontSatoshiBold = "Satoshi-Bold"
        static let californian_fontRegular = "CalifornianFB-Reg"
        static let californian_fontBold = "CalifornianFB-Bold"
        static let fontSatoshiLight = "Satoshi-Light"
    }
    
}
