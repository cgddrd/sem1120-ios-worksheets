//
//  WebViewController.swift
//  ConferenceTabBar
//
//  Created by Connor Goddard on 23/02/2016.
//  Copyright © 2016 Connor Goddard. All rights reserved.
//

import UIKit

class WebViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        if let url = NSURL(string: "http://www.apple.com/") {
            
            self.webView?.loadRequest(NSURLRequest(URL: url))
            self.webView?.delegate = self
            
            showNetworkActivityIndicator(true)
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        print("Handle the WebView load operation...")
        showNetworkActivityIndicator(false)
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError?) {
        print("WebView Failure... \(error)")
        showNetworkActivityIndicator(false)
    }
    
    func showNetworkActivityIndicator(value: Bool) {
        let app = UIApplication.sharedApplication();
        app.networkActivityIndicatorVisible = value;
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
