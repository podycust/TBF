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
 var beers = Array<String>()
    var brewer = Array<String>()
    var location = Array<String>()
    var type = Array<String>()
    var abv = Array<String>()
    var des = Array<String>()
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
        let d = UserDefaults.standard
   let da = UserDefaults.standard.bool(forKey: "new")
        
        if let watch = UserDefaults(suiteName: "group.tbf.watch") {

            watch.set(UserDefaults.standard.array(forKey: "fav"), forKey: "beer")
            watch.synchronize()
            print(watch.array(forKey: "beer"))
        }
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
                for child in xmlroot.root.children {
                    print(child.name)
                }
                
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
                        print(beers.count)
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
            //temp_func()
            //getfavs()
            //print(thefavs.count)
            print(beers.count)
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "beername", for: indexPath)

        // Configure the cell...
       cell.textLabel?.text = beers[indexPath.row]
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
