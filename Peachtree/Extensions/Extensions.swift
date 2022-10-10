//
//  Extensions.swift
//  Permaxo
//
//  Created by Pooja Softradix on 07/02/22.
//

import Foundation
import UIKit
import AVKit
import SwiftUI

extension UIView {
    func addDashedBorder(color:UIColor) {
            let color = color.cgColor
            
            let shapeLayer:CAShapeLayer = CAShapeLayer()
            let frameSize = self.frame.size
            let shapeRect = CGRect(x: 0, y: 0, width: frameSize.width, height: frameSize.height)
            
            shapeLayer.bounds = shapeRect
            shapeLayer.position = CGPoint(x: frameSize.width/2, y: frameSize.height/2)
            shapeLayer.fillColor = UIColor.clear.cgColor
            shapeLayer.strokeColor = color
            shapeLayer.lineWidth = 1
            shapeLayer.lineJoin = CAShapeLayerLineJoin.round
            shapeLayer.lineDashPattern = [10,6]
            shapeLayer.path = UIBezierPath(roundedRect: shapeRect, cornerRadius: 15).cgPath
            
            self.layer.addSublayer(shapeLayer)
        }
    
    func dropShadowOnTableViewCell(color:UIColor) {
        self.clipsToBounds = true
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = CGSize(width: 1, height: 1)
        self.layer.shadowRadius = 4.0
        self.layer.shadowOpacity = 0.5
    }
    
    func addRoundedViewCorners(width:CGFloat,colorBorder: UIColor, BackgroundColor: UIColor) {
        layer.cornerRadius = width
        layer.borderWidth = 1.0
        layer.borderColor = colorBorder.cgColor
        self.backgroundColor = BackgroundColor
        layer.masksToBounds = true
    }
    
    func dropShadowOnHomeCell() {
        self.clipsToBounds = true
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.withAlphaComponent(1.0).cgColor
        self.layer.shadowOffset = CGSize(width: 1, height: 1)
        self.layer.shadowRadius = 4.0
        self.layer.shadowOpacity = 0.5
    }
    
    func roundViewBottomEdges(radius : CGFloat) {
        //        self.layer.masksToBounds = true
        if #available(iOS 11.0, *) {
            self.layer.cornerRadius = radius
            self.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        } else {
            self.roundCorners(corners: [.topLeft, .topRight], radius: radius)
        }
    }
    
    func roundCorners(corners : UIRectCorner, radius : CGFloat) {
        let rect = self.bounds
        let maskPath = UIBezierPath.init(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize.init(width: radius, height: radius))
        
        let maskLayer = CAShapeLayer()
        maskLayer.frame = rect
        maskLayer.path = maskPath.cgPath
        
        self.layer.mask = maskLayer
    }
    
    func roundViewTopEdges(radius : CGFloat) {
        //        self.layer.masksToBounds = true
        if #available(iOS 11.0, *) {
            self.layer.cornerRadius = radius
            self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        } else {
            self.roundCorners(corners: [.topLeft, .topRight], radius: radius)
        }
    }
    
    
    
    func rotate(_ toValue: CGFloat, duration: CFTimeInterval = 0.2) {
        let animation = CABasicAnimation(keyPath: "transform.rotation")
        
        animation.toValue = toValue
        animation.duration = duration
        animation.isRemovedOnCompletion = false
        animation.fillMode = CAMediaTimingFillMode.forwards
        
        self.layer.add(animation, forKey: nil)
    }
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    func showLoadingIndicator() {
        ProgressIndicator.shared().show( at: self)
    }
    
    func hideLoadingIndicator () {
        if let indicator: ProgressIndicator = self.viewWithTag(19518) as? ProgressIndicator {
            indicator.hide()
        } else {
            
        }
    }
    
}

extension UINavigationController {
    func setStatusBar(backgroundColor: UIColor) {
        let statusBarFrame: CGRect
        if #available(iOS 13.0, *) {
            statusBarFrame = view.window?.windowScene?.statusBarManager?.statusBarFrame ?? CGRect.zero
        } else {
            statusBarFrame = UIApplication.shared.statusBarFrame
        }
        let statusBarView = UIView(frame: statusBarFrame)
        statusBarView.backgroundColor = backgroundColor
        view.addSubview(statusBarView)
    }
    
}

extension UIButton {
    func underline() {
        guard let text = self.titleLabel?.text else { return }
        
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(NSAttributedString.Key.underlineStyle, value: NSUnderlineStyle.single.rawValue, range: NSRange(location: 0, length: text.count))
        
        self.setAttributedTitle(attributedString, for: .normal)
    }
    
}

extension UITextField {
    
    func setupLeftImage(imageName:String){
        let imageView = UIImageView(frame: CGRect(x: 6, y: 12, width: 16, height: 16))
        imageView.image = UIImage(named: imageName)
        imageView.contentMode = .scaleAspectFit
        let imageContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 26, height: 40))
        imageContainerView.addSubview(imageView)
        // imageContainerView.backgroundColor = .red
        leftView = imageContainerView
        leftViewMode = .always
    }
    
    func setImageRightSideOnTextfield(image: UIImage) {
        let rightView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: self.frame.size.height))
        rightView.backgroundColor = UIColor.clear
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 25, height: self.frame.size.height))
        imageView.image = image
        imageView.contentMode = .right
        rightView.addSubview(imageView)
        self.rightView = rightView
        self.rightView?.isUserInteractionEnabled = false
        self.rightViewMode = .always
    }
}


// ----------------------------------
// MARK: - Convenience -
//
public extension UITableView {
    func register<C>(_ cellType: C.Type) where C: UITableViewCell {
        let name = String(describing: cellType.self)
        self.register(UINib(nibName: name, bundle: nil), forCellReuseIdentifier: name)
    }
    
    func deque<C>(_ cellType: C.Type, at indexPath: IndexPath) -> C where  C: UITableViewCell{
        let name = String(describing: cellType.self)
        let cell = self.dequeueReusableCell(withIdentifier: name, for: indexPath) as! C
        return cell
    }
}

public extension UICollectionView {
    func register<C>(_ cellType: C.Type) where C: UICollectionViewCell {
        let name = String(describing: cellType.self)
        self.register(UINib(nibName: name, bundle: nil), forCellWithReuseIdentifier: name)
    }
    func deque<C>(_ cellType: C.Type, at indexPath: IndexPath) -> C where C: UICollectionViewCell{
        let name = String(describing: cellType.self)
        let cell = self.dequeueReusableCell(withReuseIdentifier: name, for: indexPath) as! C
        return cell
    }
}

extension UIViewController {
    func showAlert(title: String?, msg: String,onDismiss: (() -> Void)!) {
        let alertControler = UIAlertController.init(title: title, message: msg, preferredStyle: .alert)
        alertControler.addAction(UIAlertAction.init(title: "OK", style: .cancel, handler: { (action) in //style: .destructive
            onDismiss()
        }))
        self.present(alertControler,animated: true, completion: nil)
    }
    
    func presentCameraSettings(title:String , msg:String) {
        let alertController = UIAlertController(title: title,
                                                message: msg,
                                                preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        alertController.addAction(UIAlertAction(title: "Go to Settings", style: .default) { _ in
            
            let url = URL(string: UIApplication.openSettingsURLString)!
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            }
            
        })
        
        present(alertController, animated: true)
    }
    
    func showAlertBlueOk(title: String?, msg: String,onDismiss: (() -> Void)!) {
        let alertControler = UIAlertController.init(title: title, message: msg, preferredStyle: .alert)
        alertControler.addAction(UIAlertAction.init(title: "OK", style: .default, handler: { (action) in
            onDismiss()
        }))
        self.present(alertControler,animated: true, completion: nil)
    }
    
    /**
     *  Height of status bar + navigation bar (if navigation bar exist)
     */
    
    var topbarHeight: CGFloat {
        if #available(iOS 13.0, *) {
            return (view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0.0) +
            (self.navigationController?.navigationBar.frame.height ?? 0.0)
        } else {
            return self.navigationController?.navigationBar.frame.height ?? 0.0
        }
    }
}

extension String {
    // MARK: - Validation Regex
    static let regexEmail = "[A-Z0-9a-z._%+-]{1,}+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
    
    func isValidEmail() -> Bool {
        let strText = self.trimmingCharacters(in: .whitespaces)
        return strText.validate(withRegex: String.regexEmail)
    }
    
    func validate(withRegex regex: String) -> Bool {
        let predicateRegex = NSPredicate.init(format: "SELF MATCHES %@", regex)
        return predicateRegex.evaluate(with: self)
    }
    var length: Int {
        return self.count
    }
    
    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }
    
    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
    
    func replace(target: String, withString: String) -> String  {
        return self.replacingOccurrences(of: target, with: withString, options: NSString.CompareOptions.literal, range: nil)
    }
    
    var integer: Int {
        return Int(self) ?? 0
    }
    var secondFromString : Int {
        let components: Array = self.components(separatedBy: ":")
        let hours = components[0].integer
        let minutes = components[1].integer
        let seconds = components[2].integer
        return Int((hours * 60 * 60) + (minutes * 60) + seconds)
    }
    
    func toDouble() -> Double? {
        return NumberFormatter().number(from: self)?.doubleValue
    }
}

extension UILabel {
    
    func setLineSpacing(lineSpacing: CGFloat = 0.0, lineHeightMultiple: CGFloat = 0.0) {
        guard let labelText = self.text else { return }
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        paragraphStyle.lineHeightMultiple = lineHeightMultiple
        // paragraphStyle.alignment = .center
        let attributedString: NSMutableAttributedString
        if let labelattributedText = self.attributedText {
            attributedString = NSMutableAttributedString(attributedString: labelattributedText)
        } else {
            attributedString = NSMutableAttributedString(string: labelText)
        }
        // Line spacing attribute
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attributedString.length))
        self.attributedText = attributedString
    }
}

extension UIColor {
    
    convenience init(hex:Int, alpha:CGFloat = 1.0) {
        self.init(
            red:   CGFloat((hex & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((hex & 0x00FF00) >> 8)  / 255.0,
            blue:  CGFloat((hex & 0x0000FF) >> 0)  / 255.0,
            alpha: alpha
        )
    }
    
    static func colorFromHex(_ hex: String) -> UIColor {
        var hexString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if hexString.hasPrefix("#") {
            hexString.remove(at: hexString.startIndex)
        }
        if hexString.count != 6 {
            return UIColor.magenta
        }
        
        var rgb: UInt64 = 0
        Scanner.init(string: hexString).scanHexInt64(&rgb)
        
        return UIColor.init(red: CGFloat((rgb & 0xFF0000) >> 16)/255,
                            green: CGFloat((rgb & 0x00FF00) >> 8)/255,
                            blue: CGFloat(rgb & 0x0000FF)/255,
                            alpha: 1.0)
    }
    
}

extension NSMutableAttributedString {
    
    func setColorForText(textForAttribute: String, withColor color: UIColor) {
        let range: NSRange = self.mutableString.range(of: textForAttribute, options: .caseInsensitive)
        
        // Swift 4.2 and above
        self.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
        
        // Swift 4.1 and below
        self.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
    }
    
    @discardableResult func attributedCustomString(_ text: String , color: UIColor , font: UIFont) -> NSMutableAttributedString {
        let attrs: [NSAttributedString.Key: Any] = [.font: font,.foregroundColor: color]
        let boldString = NSMutableAttributedString(string:text, attributes: attrs)
        append(boldString)
        return self
    }
}

extension UIImage {
    
    func isEqualToImage(_ image: UIImage) -> Bool {
        let data1 = self.pngData()
        let data2 = image.pngData()
        return data1 == data2
    }
    
    func compressedImage() -> (data:Data,image:UIImage) {
        var height = self.size.height
        var width = self.size.width
        let maxWidth = CGFloat(500)
        let maxHeight = CGFloat(250)
        
        
        var ratio = width/height
        let maxRatio = maxWidth/maxHeight
        
        if (height > maxHeight) || (width > maxWidth) {
            if ratio < maxRatio {
                //adjust width according to maxHeight
                ratio = maxHeight/height
                width = ratio*width
                height = maxHeight
            }
            else if ratio > maxRatio {
                ratio = maxWidth / width
                height = ratio * height
                width = maxWidth
            }
            else {
                height = maxHeight;
                width = maxWidth;
            }
        }
        
        UIGraphicsBeginImageContextWithOptions(CGSize.init(width:width, height: height),false, UIScreen.main.scale)
        self.draw(in:CGRect.init(x: 0, y: 0, width: width, height: height))
        let image = UIGraphicsGetImageFromCurrentImageContext()!
        //        let data = UIImageJPEGRepresentation(image, 0.5)! //50% compression
        let data = self.jpegData(compressionQuality: 0.5)
        UIGraphicsEndImageContext()
        return (data!,image)
    }
}

//MARK: -UIImageView
extension UIImageView {
    func roundedImage() {
        self.layer.cornerRadius = (self.frame.size.width) / 2
        self.clipsToBounds = true
    }
}

extension UIImage {
    func scalePreservingAspectRatio(targetSize: CGSize) -> UIImage {
        // Determine the scale factor that preserves aspect ratio
        let widthRatio = targetSize.width / size.width
        let heightRatio = targetSize.height / size.height
        
        let scaleFactor = min(widthRatio, heightRatio)
        
        // Compute the new image size that preserves aspect ratio
        let scaledImageSize = CGSize(
            width: size.width * scaleFactor,
            height: size.height * scaleFactor
        )
        
        // Draw and return the resized UIImage
        let renderer = UIGraphicsImageRenderer(
            size: scaledImageSize
        )
        
        let scaledImage = renderer.image { _ in
            self.draw(in: CGRect(
                origin: .zero,
                size: scaledImageSize
            ))
        }
        
        return scaledImage
    }
    
    func resize(toTargetSize targetSize: CGSize) -> UIImage {
        
        let newScale = self.scale // change this if you want the output image to have a different scale
        let originalSize = self.size
        
        let widthRatio = targetSize.width / originalSize.width
        let heightRatio = targetSize.height / originalSize.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        let newSize: CGSize
        if widthRatio > heightRatio {
            newSize = CGSize(width: floor(originalSize.width * heightRatio), height: floor(originalSize.height * heightRatio))
        } else {
            newSize = CGSize(width: floor(originalSize.width * widthRatio), height: floor(originalSize.height * widthRatio))
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(origin: .zero, size: newSize)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        let format = UIGraphicsImageRendererFormat()
        format.scale = newScale
        format.opaque = true
        let newImage = UIGraphicsImageRenderer(bounds: rect, format: format).image() { _ in
            self.draw(in: rect)
        }
        
        return newImage
    }
}

extension TimeInterval {
    func string() -> String {
        let interval = Int(self)
        let seconds = interval % 60
        let minutes = (interval / 60) % 60
        let hours = (interval / 3600)
        if hours == 0 {
            return String(format: "%d:%02d", minutes, seconds)
        }
        return String(format: "%d:%02d:%02d", hours, minutes, seconds)
    }
}

extension Data {
    func getSizeInMB() -> Double {
        let bcf = ByteCountFormatter()
        bcf.allowedUnits = [.useMB]
        bcf.countStyle = .file
        let string = bcf.string(fromByteCount: Int64(self.count)).replacingOccurrences(of: ",", with: ".")
        if let double = Double(string.replacingOccurrences(of: " MB", with: "")) {
            return double
        }
        return 0.0
    }
}

extension UIDevice {

    var hasNotch: Bool {
        if #available(iOS 11.0, *) {
           return UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0 > 0
        }
        return false
   }
}
