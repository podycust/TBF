//
//  EntertainmentViewController.swift
//  TBF
//
//  Created by Asa Bowes on 21/04/2017.
//  Copyright © 2017 Asa Bowes. All rights reserved.
//

import UIKit
import GoogleMobileAds

class EntertainmentViewController: UIViewController {
  
    
    @IBOutlet weak var web: UIWebView!
    @IBOutlet weak var bannerView: GADBannerView!

    override func viewDidLoad() {
        super.viewDidLoad()
loadads()
        loadweb()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadweb()
    {
    let burl = Bundle.main.path(forResource: "Band-List", ofType: "pdf")
        let rurl = URL(fileURLWithPath: burl!)
        let req = URLRequest(url: rurl)
        web.loadRequest(req)
        
    }
    
    func loadads() {
       if UIDevice.current.userInterfaceIdiom == .phone
       {
        bannerView.adSize = GADAdSizeFromCGSize(CGSize(width: 320, height: 50))
        }
       else{
        
        }
        bannerView.adUnitID = "ca-app-pub-7795363561300277/1002049749"
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        bannerView.frame = CGRect(x: view.frame.size.width/2 - bannerView.frame.size.width/2, y: view.frame.size.height - bannerView.frame.size.height, width: bannerView.frame.size.width, height: bannerView.frame.size.height)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
