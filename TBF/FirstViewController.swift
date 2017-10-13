//
//  FirstViewController.swift
//  TBF
//
//  Created by Asa Bowes on 16/04/2017.
//  Copyright © 2017 Asa Bowes. All rights reserved.
//

import UIKit
import GoogleMobileAds
import AEXML
import Alamofire
import SWXMLHash
import WatchConnectivity

class FirstViewController: UIViewController {

    
    
    @IBOutlet weak var web: UIWebView!
    @IBOutlet weak var prices: UILabel!
    @IBOutlet weak var openingtimes: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //self.navigationItem.title = "Welcome"
        if let watch = UserDefaults(suiteName: "group.tbf.watch") {
        
            watch.set(UserDefaults.standard.array(forKey: "fav"), forKey: "beer")
            watch.synchronize()
           // print(watch.array(forKey: "beer"))
        }
    
        // loadtimes()
       // loadprices()
       networkstatus()
        let beerwork = DispatchQueue (label: "beer_worker")
        beerwork.async {
            if connection.isconnected {
                self.connected = true
            }
            
            if !self.connected {
                let alert = UIAlertController(title: "Error", message: "It Appears That Your Not Connected To The Internet So We Where Unable to Load The Beer List", preferredStyle: UIAlertControllerStyle.alert)
                /*let DestructiveAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.destructive) {
                 (result : UIAlertAction) -> Void in
                 print("Destructive")
                 } */
                
                // Replace UIAlertActionStyle.Default by UIAlertActionStyle.default
                
                let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
                    (result : UIAlertAction) -> Void in
                    print("OK")
                }
                //alert.addAction(DestructiveAction)
                alert.addAction(okAction)
                self.present(alert, animated: true, completion: nil)
            }
            //self.networkstatus()
          /*  if connected.isconnected {
            self.loadbeersnew()
                //self.loadfavbeersinfo()
                
            } else {
                let alert = UIAlertController(title: "Error", message: "It Appears That Your Not Connected To The Internet So We Where Unable to Load The Beer List", preferredStyle: UIAlertControllerStyle.alert)
                /*let DestructiveAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.destructive) {
                    (result : UIAlertAction) -> Void in
                    print("Destructive")
                } */
                
                // Replace UIAlertActionStyle.Default by UIAlertActionStyle.default
                
                let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
                    (result : UIAlertAction) -> Void in
                    print("OK")
                }
                //alert.addAction(DestructiveAction)
                alert.addAction(okAction)
                self.present(alert, animated: true, completion: nil)
            }*/
        }  //loadbeers()
        loadads()
        web.frame = self.view.frame
        //web.frame = view.frame
        let burl = Bundle.main.url(forResource: "home", withExtension: "html")
        let req = URLRequest(url: burl!)
        web.loadRequest(req)
        NotificationCenter.default.addObserver(self, selector: #selector(land), name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)
    }
    let reach = NetworkReachabilityManager()
    var connected = Bool()
    //Lets check to see if we have working internet connection be that over Mobile/Celluar Data or Wifi and handle it
    func networkstatus() {
        reach?.listener = {
            status in
            switch  status {
            case .notReachable:
                
                self.connected = false
            case .unknown:
                break
            case .reachable(_):
                self.connected = true
                self.loadbeersnew()
            }
        }
        reach?.startListening()
    }
    //First we check to see if we have any saved userdefaults if we dont lets set them up and then continue downloading and pasring the xml file ready to be loaded
    //into the beer list table when user taps the option in navbar
    func loadbeersnew() {
        let d = UserDefaults.standard
        let da = UserDefaults.standard.bool(forKey: "new")
        
        if !da {
            let a = [""]
            d.set(true, forKey: "new")
            d.set(a, forKey: "fav")
            
        }
        phonefav = d.array(forKey: "row")!
        print(phonefav)
        loadfavbeers()
        Alamofire.request("https://www.bowesgames.co.uk/app/beers.xml", parameters: nil) //Alamofire defaults to GET requests
            
            .response { response in
               
                if let ds = response.data {
                    //print(ds) // if you want to check XML data in debug window.
                    //let string1 = String(data: ds, encoding: String.Encoding.utf8) ?? "Data could not be printed"
                    // print(string1)
                    let xml = SWXMLHash.parse(ds)
                    for elem in xml["root"]["beer"].all {
                        //  print(elem.value(ofAttribute: "Brewer"))
                        brewer.append((elem["Brewer"].element!.text))
                        abv.append((elem["ABV"].element!.text))
                        location.append((elem["Location"].element!.text))
                        beers.append((elem["Name"].element!.text))
                        type.append((elem["Type"].element!.text))
                        des.append((elem["Description"].element!.text))
                        //print(beers)
                        //print(elem.all.count)
                    }
                }
                
        }
    
    }
    
    func loadfavbeersinfo() {
        let d = UserDefaults.standard
        let da = UserDefaults.standard.bool(forKey: "new")
      
        if !da {
            let a = [""]
            d.set(true, forKey: "new")
            d.set(a, forKey: "fav")}

    }
    func loadfavbeers() {
        // let xmlfile = URL(fileURLWithPath: favlo)
        
        Alamofire.request("https://www.bowesgames.co.uk/app/fav1.xml", parameters: nil) //Alamofire defaults to GET requests
            .response { response in
                
                if let ds = response.data {
                    // print(ds) // if you want to check XML data in debug window.
                    //let string1 = String(data: ds, encoding: String.Encoding.utf8) ?? "Data could not be printed"
                    // print(string1)
                    let xml = SWXMLHash.parse(ds)
                    for elem in xml["root"]["beer"].all {
                        //  print(elem.value(ofAttribute: "Brewer"))
                        favbrewer.append((elem["Brewer"].element!.text))
                        favabv.append((elem["ABV"].element!.text))
                        favlocation.append((elem["Location"].element!.text))
                        favbeers.append((elem["Name"].element!.text))
                        favtype.append((elem["Type"].element!.text))
                        favdes.append((elem["Description"].element!.text))
                        //print(favbeers)
                        //print(elem.all.count)
                        
                    }
                    WCSession.default.transferUserInfo(["Beers":favbeers])
                    WCSession.default.transferUserInfo(["Favs":phonefav])
                    WCSession.default.transferUserInfo(["Type":favtype])
                }
        }
    }
        
    func loadbeers() {
        let d = UserDefaults.standard
        let da = UserDefaults.standard.bool(forKey: "new")
        
        
        if !da {
            let a = [""]
            d.set(true, forKey: "new")
            d.set(a, forKey: "fav")}
        guard let xmlfile = Bundle.main.url(forResource: "beers", withExtension: "xml"),
            let data = try? Data(contentsOf: xmlfile)
            else{return
                
        }
        // let file = Bundle.main.pa
        /* let url1 = Bundle.main.url(forResource: "beers", withExtension: "db")
         let URL4 = URL(fileURLWithPath: NSPersistentContainer.defaultDirectoryURL().relativePath + "beers.db")
         if FileManager.default.fileExists(atPath: NSPersistentContainer.defaultDirectoryURL().relativePath + "beers.db"){
         print("True")
         try? FileManager.default.removeItem(at: URL4)
         getfavs()
         }
         else{
         print("false")
         try? FileManager.default.copyItem(at: url1!, to: URL4)
         */ do{
            
            let xmlroot = try AEXMLDocument(xml: data)
            /* for child in xmlroot.root.children {
             //print(child.name)
             }
             */
            //let f = fav
            for beer in xmlroot.root["beer"].all! {
                if let brew = beer.attributes["Brewer"] {
                    brewer.append(brew)
                    //fav.brewer = brew
                    //try? context.save()
                }
                if let loc = beer.attributes["Location"]{
                    location.append(loc)
                    //fav.location = loc
                    //try? context.save()
                    //print(fav.location?.count)
                }
                if let ty = beer.attributes["Type"]{
                    type.append(ty)
                    //fav.type = ty
                    ////try? context.save()
                }
                if let a = beer.attributes["ABV"]{
                    abv.append(a)
                    // fav.abv = a
                    //try? context.save()
                }
                if let d = beer.attributes["Description"]{
                    des.append(d)
                    // fav.description1 = d
                    //try? context.save()
                }
                if let name = beer.attributes["Name"]{
                    beers.append(name)
                    //print(beers)
                    // fav.name = name
                    //ry? context.save()
                    // fav.name?.append(name)
                    //  print(fav.name?.count)
                    //  print(fav.name?.last)
                    // print(beers.count)
                    //try? context.save()
                }
                
                //favoo.b.append(false)
                /*var i = 0
                 while i <= beers.count {
                 fav.name = beers[i]
                 print(i)
                 print(beers[i])
                 i = i + 1
                 try? context.save()
                 }*/
                //getfavs()
                // print(thefavs.count)
            }
            
            
            
            
            /* if let beerss = xmlroot.root["beer"].all {
             for Name in beerss {
             if let n = Name.value{
             print(n)
             beers.append(n)
             }
             }
             }*/
            
         }
         catch {
            
            
        }
    }
    @objc func land() {
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
        let attrs = [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 14)]
        let attstring = NSMutableAttributedString(string: boldtext, attributes: attrs)
        
        let tuesfri = "Tues- Fri: "
        let tat = [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 14)]
        let tesstring = NSMutableAttributedString(string: tuesfri, attributes: tat)
        attstring.append(tesstring)
        
        let tueshours = "12-3, 6-11 "
        let normtueshours = NSMutableAttributedString(string: tueshours)
        attstring.append(normtueshours)
        
        let satday = "Sat: "
        let satdayatt = [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 14)]
        let sata = NSMutableAttributedString(string: satday, attributes: satdayatt)
        attstring.append(sata)
        
        let sathours = "12-7"
        let satfont = NSMutableAttributedString(string: sathours)
        
        attstring.append(satfont)
       // openingtimes.attributedText = attstring
    }
    
    func loadprices() {
        let ad = "Admission: "
        let adatt = [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 14)]
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

class connection {
    class var isconnected: Bool {
        return NetworkReachabilityManager()!.isReachable
    }
    

}

