//
//  WebVC.swift
//  MyMovies
//
//  Created by Rafał Kozłowski on 08.02.2016.
//  Copyright © 2016 Rafał Kozłowski. All rights reserved.
//

import UIKit
import WebKit

class WebVC: UIViewController {
    
    @IBOutlet weak var webContainer: UIView!
    
    var url: String!
 
    
    
    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        webView = WKWebView()
        webContainer.addSubview(webView)
        
    }
    
    override func viewDidAppear(animated: Bool) {
        let frame = CGRectMake(0, 0, webContainer.bounds.width, webContainer.bounds.height)
        webView.frame = frame
        
        loadRequest(url)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadRequest(urlStr: String) {
        
        let url = NSURL(string: urlStr)!
        let request = NSURLRequest(URL: url)
        webView.loadRequest(request)
    }
  

    
    @IBAction func backBtnPressed(sender: UIButton) {
        dismissViewControllerAnimated(true, completion: nil)
    }

}
