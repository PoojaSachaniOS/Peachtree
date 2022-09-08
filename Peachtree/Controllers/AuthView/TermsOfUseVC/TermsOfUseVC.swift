//
//  TermsOfUseVC.swift
//  Peachtree
//
//  Created by Anand on 31/08/22.
//

import UIKit
import WebKit

class TermsOfUseVC: UIViewController {
    // ----------------------------------
    //  MARK: - IB-OUTLET(S)
    //
    @IBOutlet weak var webVw: WKWebView!
    @IBOutlet weak var activityIndicatorVw: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadHtmlFile()
    }
    
    // ----------------------------------
    //  MARK: - PRIVATE METHOD(S)
    //
    private func loadHtmlFile() {
        self.webVw.navigationDelegate = self
        activityIndicatorVw.startAnimating()
        
        let url = URL (string: "https://www.google.co.in/")
        let requestObj = URLRequest(url: url!)
        webVw.load(requestObj)
    }

    // ----------------------------------
    //  MARK: - OVERRIDE METHOD(S)
    //
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.setHidesBackButton(true, animated:true);
    }

}

// ----------------------------------
//  MARK: - BUTTION ACTION(S)
//
extension TermsOfUseVC {
    
    @IBAction func btnAcceptTapped(_ sender: Any) {
        
    }
    
    @IBAction func btnDeclineTapped(_ sender: Any) {
    }
}


// ----------------------------------
//  MARK: - WKNavigation DELEGATE(S)
//
extension TermsOfUseVC : WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        decisionHandler(.allow)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicatorVw.stopAnimating()
        if webView.isLoading { return }
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        activityIndicatorVw.stopAnimating()
    }
    
}
