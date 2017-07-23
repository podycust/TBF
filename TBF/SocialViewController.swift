//
//  SocialViewController.swift
//  TBF
//
//  Created by Asa Bowes on 18/04/2017.
//  Copyright © 2017 Asa Bowes. All rights reserved.
//

import UIKit
//import SwiftWebVC
import MessageUI
import GoogleMobileAds

class SocialViewController: UIViewController {
    
    @IBOutlet weak var nav: UINavigationItem!
    
    @IBOutlet weak var bntemail: UIButton!
    @IBOutlet weak var bnttwitter: UIButton!
  /*  @IBAction func bnttwitter(_ sender: UIButton) {
        let tw = SwiftWebVC(urlString: "https://twitter.com/thurrockcamra")
        self.navigationController?.pushViewController(tw, animated: true)
        
    } */
    @IBOutlet weak var bannerView: GADBannerView!

    @IBAction func bntemail(_ sender: UIButton) {
        
        
       let mail = sendmail()
        if MFMailComposeViewController.canSendMail(){
        self.present(mail, animated: true, completion: nil)
        }else{
            mail.mailerror()
        }
        
    }
    

    
  
   
   
    override func viewDidLoad() {
        super.viewDidLoad()
loadads()
        // Do any additional setup after loading the view.
        //let b =  Bundle.main.path(forResource: "social", ofType: "html")
        let u = URL(string: "https://bowesgames.co.uk/app/social.html")
        let res = URLRequest(url: u!)
       // web.frame = self.view.bounds
        web.loadRequest(res)
        NotificationCenter.default.addObserver(self, selector: #selector(enterfor), name: NSNotification.Name.UIApplicationDidEnterBackground, object: nil)
    }
    @IBOutlet weak var web: UIWebView!
    func enterfor()
    {
        web.reload()
    }
    func loadads() {
        if UIDevice.current.userInterfaceIdiom == .phone{
            bannerView.adSize = GADAdSizeFromCGSize(CGSize(width: 320, height: 50))
        }
        else {
            bannerView.adSize=GADAdSizeFromCGSize(CGSize(width: 465, height: 60))
        }
       
        bannerView.adUnitID = "ca-app-pub-7795363561300277/1002049749"
        bannerView.rootViewController = self
         bannerView.frame = CGRect(x: view.frame.size.width/2 - bannerView.frame.size.width/2, y: view.frame.size.height - bannerView.frame.size.height, width: bannerView.frame.size.width, height: bannerView.frame.size.height)
     bannerView.load(GADRequest())
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var btnfacebook: UIButton!

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func btnfacebook(_ sender: UIButton) {
       /* let webView = UIWebView(frame: self.view.frame)
        webView.scalesPageToFit = true
        view.addSubview(webView)
        
        let urlS = "https://www.facebook.com/events/124597948082542"
        let url = URL(string: urlS)
        let request = URLRequest(url: url!)
        webView.loadRequest(request) */
      //  let webVC = SwiftWebVC(urlString: "https://www.facebook.com/events/124597948082542")
      //  self.navigationController?.pushViewController(webVC, animated: true)
}
        //view.addSubview(webVC)

    }
    /*@IBAction func btnfacebook(_ sender: UIButton) {
        let webVC = SwiftWebVC(urlString: "https://www.facebook.com/events/124597948082542")
        self.navigationController?.pushViewController(webVC, animated: true)
    }*/


extension UIViewController : MFMailComposeViewControllerDelegate {
    
    func sendmail() -> MFMailComposeViewController{
        let mail = MFMailComposeViewController()
        
            
            mail.mailComposeDelegate = self
            mail.setToRecipients(["turnnidgehelen@hotmail.com"])
            mail.setSubject("Thurrock Beer Festival Enquiry")
        
        
        return mail
    }
    func mailerror(){
                    let alert = UIAlertController.init(title: "Error", message: "Sorry, We Was Unable to Send Message Please Check Your Email Settings and Try Again", preferredStyle: .alert)
            alert.addAction(UIAlertAction.init(title: "Ok", style: .default, handler: nil))
             self.present(alert, animated: true, completion: nil)
       
    }
    
    // MFMailComposeViewControllerDelegate Method
    public func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
}
