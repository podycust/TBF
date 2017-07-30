//
//  BeerTableViewController.swift
//  TBF
//
//  Created by Asa Bowes on 28/07/2017.
//  Copyright © 2017 Asa Bowes. All rights reserved.
//

import UIKit
import AEXML

class BeerTableViewController: UITableViewController {
 var beers = Array<String>()
    var brewer = Array<String>()
    var location = Array<String>()
    var type = Array<String>()
    var abv = Array<String>()
    var des = Array<String>()
    override func viewDidLoad() {
        super.viewDidLoad()
    
guard let xmlfile = Bundle.main.url(forResource: "beers", withExtension: "xml"),
        let data = try? Data(contentsOf: xmlfile)
   else{return
    
        }
        
        do{
        
            let xmlroot = try AEXMLDocument(xml: data)
            for child in xmlroot.root.children {
                print(child.name)
            }
            for beer in xmlroot.root["beer"].all! {
                if let brew = beer.attributes["Brewer"] {
                    brewer.append(brew)
                }
                if let loc = beer.attributes["Location"]{
                    location.append(loc)
                }
                if let ty = beer.attributes["Type"]{
                    type.append(ty)
                }
                if let a = beer.attributes["ABV"]{
                    abv.append(a)
                }
                if let d = beer.attributes["Description"]{
                    des.append(d)
                }
                if let name = beer.attributes["Name"]{
                    beers.append(name)
                }
                
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
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

   /* override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return beers.count
    }
*/
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return beers.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "beername", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = beers[indexPath.row]
        return cell
    }
   
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       performSegue(withIdentifier: "info", sender: indexPath.row)
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let bi = segue.destination as! infoViewController
        let no = sender as! Int
        bi.n = beers[no]
        bi.b = "Brewer: " + brewer[no]
        bi.a = "ABV: " + abv[no]
        bi.d = des[no]
        bi.l = "Location: " + location[no]
    }
    

}
