//
//  BeerViewController.swift
//  TBF
//
//  Created by Asa Bowes on 19/04/2017.
//  Copyright © 2017 Asa Bowes. All rights reserved.
//

import UIKit

class BeerViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var loadinginc: UIActivityIndicatorView!
    @IBOutlet weak var web: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //lets webpage with beers on it!
        web.delegate = self
        //let site = URL (string:  "http://www.bowesgames.co.uk/thurrock-beer-festival/")
        let site = URL(string: "https://www.bowesgames.co.uk/app/pdf/Cider-Wine-list.pdf")
        let request = URLRequest(url: site!)
       
       
        web.loadRequest(request)
        NotificationCenter.default.addObserver(self, selector: #selector(enterforground), name: NSNotification.Name.UIApplicationDidEnterBackground, object: nil)
        // Do any additional setup after loading the view.
        
      
    }
    @objc func enterforground() {
        web.reload()
    }
    @IBOutlet weak var loader: UIActivityIndicatorView!
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        // Dispose of any resources that can be recreated.
    }
    
    /* Display loding spinner while the page is loading */
    func webViewDidStartLoad(_ webView: UIWebView) {
        loadinginc.isHidden = false
        loadinginc.startAnimating()
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        loadinginc.stopAnimating()
        loadinginc.isHidden = true
        
    }
}
