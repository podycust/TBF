//
//  FirstViewController.swift
//  TBF
//
//  Created by Asa Bowes on 16/04/2017.
//  Copyright © 2017 Asa Bowes. All rights reserved.
//

import UIKit
import GoogleMobileAds

class FirstViewController: UIViewController {

    
    
    @IBOutlet weak var web: UIWebView!
    @IBOutlet weak var prices: UILabel!
    @IBOutlet weak var openingtimes: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //self.navigationItem.title = "Welcome"
       loadtimes()
        loadprices()
        loadads()
        web.frame = self.view.bounds
        //web.frame = view.frame
        let burl = Bundle.main.url(forResource: "home", withExtension: "html")
        let req = URLRequest(url: burl!)
        web.loadRequest(req)
        NotificationCenter.default.addObserver(self, selector: #selector(land), name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)
    }
    func land() {
        if UIDevice.current.orientation == .landscapeLeft {
        web.frame = self.view.bounds}
       if UIDevice.current.orientation == .landscapeRight{
          web.frame = self.view.bounds
        }
    }
    func loadads() {
        if UIDevice.current.userInterfaceIdiom == .phone{
            bannerView.adSize = GADAdSizeFromCGSize(CGSize(width: 320, height: 50))
        }
        else
        {
            bannerView.adSize = GADAdSizeFromCGSize(CGSize(width: 468, height: 60))
        }
        
        //bannerView.adSize = kGADAdSizeSmartBannerPortrait
        bannerView.adUnitID = "ca-app-pub-7795363561300277/1002049749"
        bannerView.rootViewController = self
        bannerView.frame = CGRect(x: view.frame.size.width/2 - bannerView.frame.size.width/2, y: view.frame.size.height - bannerView.frame.size.height, width: bannerView.frame.size.width, height: bannerView.frame.size.height)
        bannerView.load(GADRequest())
        
    }
    @IBOutlet weak var bannerView: GADBannerView!
    func loadtimes(){
        let boldtext = "Opening Times: "
        let attrs = [NSFontAttributeName : UIFont.boldSystemFont(ofSize: 14)]
        let attstring = NSMutableAttributedString(string: boldtext, attributes: attrs)
        
        let tuesfri = "Tues- Fri: "
        let tat = [NSFontAttributeName : UIFont.boldSystemFont(ofSize: 14)]
        let tesstring = NSMutableAttributedString(string: tuesfri, attributes: tat)
        attstring.append(tesstring)
        
        let tueshours = "12-3, 6-11 "
        let normtueshours = NSMutableAttributedString(string: tueshours)
        attstring.append(normtueshours)
        
        let satday = "Sat: "
        let satdayatt = [NSFontAttributeName : UIFont.boldSystemFont(ofSize: 14)]
        let sata = NSMutableAttributedString(string: satday, attributes: satdayatt)
        attstring.append(sata)
        
        let sathours = "12-7"
        let satfont = NSMutableAttributedString(string: sathours)
        
        attstring.append(satfont)
       // openingtimes.attributedText = attstring
    }
    
    func loadprices() {
        let ad = "Admission: "
        let adatt = [NSFontAttributeName : UIFont.boldSystemFont(ofSize: 14)]
        let maintextprice = NSMutableAttributedString(string: ad, attributes: adatt)
        
        let mainprice = "Free Tue - Fri lunchtimes, £1 Tue & Wed evenings, £3 Thu evening, £4 Fri evening, £2 Sat all day."
        let mainpriceatt = NSMutableAttributedString(string: mainprice)
        maintextprice.append(mainpriceatt)
       // prices.attributedText = maintextprice
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

