//
//  WebViewVC.swift
//  Peachtree
//
//  Created by Anand on 06/09/22.
//

import UIKit
import WebKit

class WebViewVC: CustomBaseVC {
    //  MARK: - IB-OUTLET(S)
    @IBOutlet weak var webVw: WKWebView!
    var strWebUrl:String?
    var strNavTitle:String?
    
    // MARK: - View Loading -
    override func viewDidLoad() {
        super.viewDidLoad()
        super.setupLeftBarButtonItem()
        webVw.navigationDelegate = self
        self.loadWebVwRequest()
        self.navigationItem.title = strNavTitle
        self.setNeedsStatusBarAppearanceUpdate()
    }
    
    // MARK: - OVERRIDE METHOD(S)
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    //  MARK: - PRIVATE METHOD(S)
    private func loadWebVwRequest() {
        self.view.showLoadingIndicator()
        if let strWebUrl = strWebUrl, !strWebUrl.isEmpty {
            let link = URL(string:strWebUrl)!
            let request = URLRequest(url: link)
            webVw.load(request)
        }
    }
}

//MARK: WKNavigation Delegate
extension WebViewVC : WKNavigationDelegate {
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        decisionHandler(.allow)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        DispatchQueue.main.async {
            self.view.hideLoadingIndicator()
        }
    }
}
