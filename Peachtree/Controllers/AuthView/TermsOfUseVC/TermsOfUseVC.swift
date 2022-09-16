//
//  TermsOfUseVC.swift
//  Peachtree
//
//  Created by Anand on 31/08/22.
//

import UIKit
import WebKit

class TermsOfUseVC: UIViewController {
    //  MARK: - IB-OUTLET(S)
    @IBOutlet weak var webVw: WKWebView!
    
    // MARK: - View Loading -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadHtmlFile()
        self.navigationItem.title = "Terms of use"
        self.setNeedsStatusBarAppearanceUpdate()

    }
    
    //  MARK: - OVERRIDE METHOD(S)
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.setHidesBackButton(true, animated:true);
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    //  MARK: - PRIVATE METHOD(S)
    private func loadHtmlFile() {
        self.webVw.navigationDelegate = self
        self.view.showLoadingIndicator()
        
        let url = URL (string: "https://www.google.co.in/")
        let requestObj = URLRequest(url: url!)
        webVw.load(requestObj)
    }
    

}

//  MARK: - BUTTION ACTION(S)
extension TermsOfUseVC {
    @IBAction func btnAcceptTapped(_ sender: Any) {
        if #available(iOS 13.0, *) {
            SceneDelegate.shared?.makingRootFlow(Constants.AppRootFlow.kEnterHome)
        } else {
            AppDelegate.instance().makingRootFlow(Constants.AppRootFlow.kEnterHome)
        }
    }
    
    @IBAction func btnDeclineTapped(_ sender: Any) {
        exit(0)
    }
}

//  MARK: - WKNavigation DELEGATE(S)
extension TermsOfUseVC : WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        decisionHandler(.allow)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        if webView.isLoading { return }
        self.view.hideLoadingIndicator()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        self.view.hideLoadingIndicator()
    }
    
}
