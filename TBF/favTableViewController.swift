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
        tableView.reloadData()
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


