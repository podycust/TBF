//
//  BeerTableViewController.swift
//  TBF
//
//  Created by Asa Bowes on 28/07/2017.
//  Copyright © 2017 Asa Bowes. All rights reserved.
//

import UIKit
import AEXML
import CoreData

class BeerTableViewController: UITableViewController {
 /*var beers = Array<String>()
    var brewer = Array<String>()
    var location = Array<String>()
    var type = Array<String>()
    var abv = Array<String>()
    var des = Array<String>() */
    //var thefavs : [Favbeers] = []
    
    /*func getfavs(){
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
            
            if let corefavs = try? context.fetch(Favbeers.fetchRequest()) as? [Favbeers]{
                if let tfav = corefavs{
                    print (tfav.first?.name)
                    thefavs = tfav
                  
                    tableView.reloadData()
                }
            }
        }
    }
    */
    override func viewDidLoad() {
        super.viewDidLoad()
      
            //temp_func()
            //getfavs()
            //print(thefavs.count)
        
        }
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
       // }}
    
    
    /*func temp_func() {
        var n = beers.count
        var i = 0
        //removecoredata()
       // var appDel: AppDelegate = (UIApplication.shared.delegate as! AppDelegate)
        //var context: NSManagedObjectContext = appDel.managedObjectContext!
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext{
            //let fav = Favbeers(context: context)
            let fav = Favbeers(entity: Favbeers.entity(), insertInto: context)
            while (i != n){
                fav.setValue(beers[i], forKeyPath: "name")
                fav.setValue(abv[i], forKeyPath: "abv")
                fav.setValue(brewer[i], forKeyPath: "brewer")
                fav.setValue(des[i], forKeyPath: "description1")
                fav.setValue(location[i], forKeyPath: "loction")
                fav.name = beers[i]
                //fav.name?.append(beers[i])
                print(beers[i],abv[i],brewer[i])
                print(fav.name!)
               try? context.save()
                //print(fav.abv?[i],fav.brewer?[i],fav.name?[i])
                i = i + 1
            }
            
            //try? context.save()
            
        }
       // tableView.reloadData()
        
    }
    */
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
   
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "beername", for: indexPath) as? beerscellTableViewCell else {
        fatalError("Error")
        }

        // Configure the cell...
        cell.beername.text = beers[indexPath.row]
        if type[indexPath.row] == "Golden"{
            cell.beerimage.image = UIImage(named: "golden")
        }
        if type[indexPath.row] == "Amber"{
            cell.beerimage.image = UIImage(named: "amber")
        }
        if type[indexPath.row] == "Porter" {
            cell.beerimage.image = UIImage(named: "porter")
        }
        if type[indexPath.row] == "Pale" {
            cell.beerimage.image = UIImage(named: "pale")
        }
        if type[indexPath.row] == "Ruby" {
            cell.beerimage.image = UIImage(named: "ruby")
        }
        if type[indexPath.row] == "Stout" {
            cell.beerimage.image = UIImage(named: "stout")
        }
        if type[indexPath.row] == "Dark" {
            cell.beerimage.image = UIImage(named: "dark")
        }
        
        if type[indexPath.row] == "Brown" {
            cell.beerimage.image = UIImage(named: "brown")
        }
       //cell.textLabel?.text = beers[indexPath.row]
        //cell.textLabel?.text = thefavs[indexPath.row].name
        return cell
    }
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
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

    //var favs : fav?
    // MARK: - Navigation
   // var favv = Favbeers()
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        let bi = segue.destination as! infoViewController
        let no = sender as! Int
       // print(thefavs.count)
        bi.n = beers[no]
        bi.b = "Brewer: " + brewer[no]
        bi.a = "ABV: " + abv[no]
        bi.d = des[no]
        bi.l = "Location: " + location[no]
       bi.row = String(no)
        bi.r = no
        let d = UserDefaults.standard
        let a = d.array(forKey: "fav") as! Array<String>
bi.fava = a.contains(beers[no])
        
        
       // bi.fava = favoo.b[no]
        //fav.b[no] = true
        //favs = findfav(row: no)
  
    }
   

}
