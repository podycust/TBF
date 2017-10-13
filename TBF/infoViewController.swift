//
//  infoViewController.swift
//  TBF
//
//  Created by Asa Bowes on 28/07/2017.
//  Copyright © 2017 Asa Bowes. All rights reserved.
//

import UIKit
import CoreData
//import AssistantKit
import WatchConnectivity

class infoViewController: UIViewController {
    
    

    //var fav = Favbeers()
   // var selectedfav : Favbeers? = nil
    var f = Array<Any>()
    var rowd = Array<Any>()
    //var fav = false
    /// called when view reappers checks if the currect beer is still in favorites!
    override func viewDidAppear(_ animated: Bool) {
       
        //location.sizeToFit()
        //abv.sizeToFit()
        //type.sizeToFit()
        //des.sizeToFit()
        if let favobject = UserDefaults.standard.array(forKey: "fav") {
            let fd = favobject as! Array<String>
            if fd.contains(self.navigationItem.title!){
                favbut.setImage(UIImage(named: "icons8-Star Filled"), for: UIControlState.normal)
                favbut.setTitle("Remove From Favorites", for: UIControlState.normal)
            } else {
                favbut.setImage(UIImage(named: "icons8-Star"), for: UIControlState.normal)
                favbut.setTitle("Add To Favorites", for: UIControlState.normal)
            }
        }
        
        if UserDefaults.standard.array(forKey: "row") == nil {
            UserDefaults.standard.set(rowd, forKey: "row")
        }
    }
    
    
    func pressed()
    {
        let defaults = UserDefaults.standard
        f = defaults.array(forKey: "fav")!
       favstore = defaults.array(forKey: "row")!
        if fava == true {
            favbut.setImage(UIImage(named: "icons8-Star"), for: UIControlState.normal)
            favbut.setTitle("Add To Favorites", for: UIControlState.normal)
            let g = f as! Array<String>
            if let i = g.index(of: self.navigationItem.title!) {
               f.remove(at: i)
                UserDefaults.standard.set(f, forKey: "fav")
                sendtoWatch()
                //WCSession.default().transferUserInfo(["beers":f])
               WCSession.default.transferUserInfo(["Favs":phonefav])
            }
        fava = false
            
            
        } else {
            favbut.setImage(UIImage(named: "icons8-Star Filled"), for: UIControlState.normal)
            favbut.setTitle("Remove From Favorites", for: UIControlState.normal)
            //fav.name = n
           // fav.no = row
           // favoo.b[r] = true
            fava = true
            //try? context.save()
           
           // print(f)
            //rowd.append(row)
            favstore.append(row)
            print(row)
           // print(rowd)
            f.append(navigationItem.title)
            defaults.set(f, forKey: "fav")
            defaults.set(favstore, forKey: "row")
            //sendtoWatch()
            WCSession.default.transferUserInfo(["Favs":phonefav])
            //print("added")
        }
        
        //print("pressed")
        
    }
//var lastMessage = CFAbsoluteTimeGetCurrent()
    func sendtoWatch() {
       /*
        let currentTime = CFAbsoluteTimeGetCurrent()
        
        // if less than half a second has passed, bail out
        if lastMessage + 0.5 > currentTime {
            return
        }
        
        // send a message to the watch if it's reachable
        if (WCSession.default.isReachable) {
            // this is a meaningless message, but it's enough for our purposes
            var a = Array<Any> ()
            a = UserDefaults.standard.array(forKey: "row")!
            WCSession.default.transferUserInfo(["Favs":a])
            let message = ["Favs": a]
            do { try WCSession.default.updateApplicationContext(message)}
            catch {
                print("Error!")}
            WCSession.default.sendMessage(message, replyHandler: nil)
        }
        
        // update our rate limiting property
        lastMessage = CFAbsoluteTimeGetCurrent()
        */
    }
    
    
    
    @IBAction func favpress(_ sender: Any) {
      pressed()
    }
    @IBOutlet weak var favbut: UIButton!
    @IBOutlet weak var brewer: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var abv: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var des: UILabel!
  
    var n = ""
    var l = ""
    var b = ""
    var a = ""
    var t = ""
    var d = ""
    var fava = false
    var row = ""
    var r = 0
    override func viewDidLoad() {
        super.viewDidLoad()
       // print(a)
      //  print(n)
//name.text = n
        location.text = l
        des.text = d
        abv.text = a
        type.text = t
        brewer.text = b
        des.sizeToFit()
        location.adjustsFontSizeToFitWidth = true
         brewer.adjustsFontSizeToFitWidth = true
       // let screen = Device.screen
      /*  if l != "Location: South Woodham Ferrers, Essex" {
            if UIDeviceOrientation.portrait.isPortrait {
                switch screen {
                case .inches_4_0:
                    //location.font = location.font.withSize(17)
                    //location.sizeToFit()
                    //print("Running on iPhone 5, 5S or SE")
                    break
                case .unknown: break
                    
                case .inches_3_5:
                    break
                case .inches_4_7:
                    break
                case .inches_5_5:
                    break
                case .inches_7_9:
                    break
                case .inches_9_7:
                    break
                case .inches_12_9:
                    break
                }
                
            }
        }*/
        //print(row)
        // Do any additional setup after loading the view.
        self.navigationItem.title = n
        
        if fava == false {
            favbut.setImage(UIImage(named: "icons8-Star"), for: UIControlState.normal)
            favbut.setTitle("Add To Favorites", for: UIControlState.normal)
        } else {
            favbut.setImage(UIImage(named: "icons8-Star Filled"), for: UIControlState.normal)
            favbut.setTitle("Remove From Favorites", for: UIControlState.normal)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
