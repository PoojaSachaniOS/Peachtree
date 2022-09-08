//
//  WebViewVC.swift
//  Peachtree
//
//  Created by Anand on 06/09/22.
//

import UIKit
import WebKit

class WebViewVC: UIViewController {
    @IBOutlet weak var webVw: WKWebView!
    var strWebUrl:String?
    var strNavTitle:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadWebVwRequest()
    }
    
    private func loadWebVwRequest() {
        if let strWebUrl = strWebUrl, !strWebUrl.isEmpty {
            let link = URL(string:strWebUrl)!
            let request = URLRequest(url: link)
            webVw.load(request)
        }
        
        if let strWebUrl = strWebUrl, !strWebUrl.isEmpty {
            
        }
        
    }


}

//MARK: WKNavigation Delegate
extension WebViewVC : WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        decisionHandler(.allow)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
    }
}
