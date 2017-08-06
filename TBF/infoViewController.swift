//
//  infoViewController.swift
//  TBF
//
//  Created by Asa Bowes on 28/07/2017.
//  Copyright © 2017 Asa Bowes. All rights reserved.
//

import UIKit
import CoreData


class infoViewController: UIViewController {

    //var fav = Favbeers()
   // var selectedfav : Favbeers? = nil
    var f = Array<Any>()
    //var fav = false
    /// called when view reappers checks if the currect beer is still in favorites!
    override func viewDidAppear(_ animated: Bool) {
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
    }
    
    
    func pressed()
    {
        let defaults = UserDefaults.standard
        f = defaults.array(forKey: "fav")!

        if fava == true {
            favbut.setImage(UIImage(named: "icons8-Star"), for: UIControlState.normal)
            favbut.setTitle("Add To Favorites", for: UIControlState.normal)
            let g = f as! Array<String>
            if let i = g.index(of: self.navigationItem.title!) {
               f.remove(at: i)
                UserDefaults.standard.set(f, forKey: "fav")
                //WCSession.default().transferUserInfo(["beers":f])
                if let watch = UserDefaults(suiteName: "group.tbf.watch") {
                    watch.set(f, forKey: "beers")
                    watch.synchronize()
                }
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
           
            print(f)
            f.append(navigationItem.title)
            defaults.set(f, forKey: "fav")
            print("added")
        }
        
        print("pressed")
        
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
        print(n)
//name.text = n
        location.text = l
        des.text = d
        abv.text = a
        type.text = t
        brewer.text = b
        des.sizeToFit()
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
