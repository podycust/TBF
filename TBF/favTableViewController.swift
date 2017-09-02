//
//  favTableViewController.swift
//  TBF
//
//  Created by Asa Bowes on 30/07/2017.
//  Copyright © 2017 Asa Bowes. All rights reserved.
//

import UIKit
import CoreData
import AEXML
import Alamofire
import SWXMLHash

class favTableViewController: UITableViewController {

    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: IndexPath) -> Bool {
        return true
    }
    override func viewDidAppear(_ animated: Bool) {
        if let favobject = d.array(forKey: "fav") {
            fav = favobject
        }
        if connected.isconnected {
            loadfavbeers()} 
        tableView.reloadData()
    }
   
    func loadfavbeers() {
       // let xmlfile = URL(fileURLWithPath: favlo)
  
        Alamofire.request("https://www.bowesgames.co.uk/app/fav1.xml", parameters: nil) //Alamofire defaults to GET requests
            .response { response in
                print(response.response)
                if let ds = response.data {
                    print(ds) // if you want to check XML data in debug window.
                    //let string1 = String(data: ds, encoding: String.Encoding.utf8) ?? "Data could not be printed"
                   // print(string1)
                     var xml = SWXMLHash.parse(ds)
                    for elem in xml["root"]["beer"].all {
                      //  print(elem.value(ofAttribute: "Brewer"))
                        favbrewer.append((elem["Brewer"].element!.text))
                        favabv.append((elem["ABV"].element!.text))
                        favlocation.append((elem["Location"].element!.text))
                        favbeers.append((elem["Name"].element!.text))
                        favtype.append((elem["Type"].element!.text))
                        favdes.append((elem["Description"].element!.text))
                        print(favbeers)
                        //print(elem.all.count)
                    }
                }
        }
            //let data = try? Data.init(contentsOf: xmlfile)
           
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
         */
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
       if(editingStyle == .delete ) {
        
        
           
            //self.tableView.beginUpdates()
        fav.remove(at: indexPath.row + 1)
        UserDefaults.standard.set(fav, forKey: "fav")
            tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
           tableView.reloadData()
            
        }
            
            // Tell the table view to animate out that row
            //tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
            //tableView.deleteRows(at: [indexPath], with: .automatic)
        
            //TableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        
 
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let favobject = d.array(forKey: "fav") {
            fav = favobject
        }
       print(fav.count)
        //savefav()
       // loadfav()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
 var d = UserDefaults.standard
  var fav = Array<Any>()
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
/*
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return fav.count
    }*/
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print(fav.count)
    
        return fav.count - 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "fav", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = fav[indexPath.row + 1] as? String
        //print(fav[indexPath.row])
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var a = Array<Any> ()
        a = UserDefaults.standard.array(forKey: "row")!
        print(a)
        let gg = String(describing: a[indexPath.row])
       // let c = gg as! Int
     
        performSegue(withIdentifier: "favinfo", sender: gg)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let bi = segue.destination as! infoViewController
       print(sender)
        let ss = sender as! String
        print(ss)
        guard let b = sender as? String
            else {
                print("Error") // Was not a string
                return // needs a return or break here
        }
        print(b) // Was a string
        let no: Int = { return Int(b)! }()
       //let no = sender as! Int
       // let no = Int(g)
       print(no)
        // print(thefavs.count)
        bi.n = beers[no]
        bi.b = "Brewer: " + brewer[no]
        bi.a = "ABV: " + abv[no]
        bi.d = des[no]
        bi.l = "Location: " + location[no]
        bi.row = String(describing: no)
        bi.r = no
        let d = UserDefaults.standard
        let a = d.array(forKey: "fav") as! Array<String>
        bi.fava = a.contains(beers[no])
        
        
        // bi.fava = favoo.b[no]
        //fav.b[no] = true
        //favs = findfav(row: no)
        
    }
}


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


