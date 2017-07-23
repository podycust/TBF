//
//  tabviewcontroller.swift
//  TBF
//
//  Created by Asa Bowes on 17/04/2017.
//  Copyright © 2017 Asa Bowes. All rights reserved.
//
/*
import UIKit
import  Foundation

class TabviewController: UIViewController {
    
    var elements: [Element] = []
    //let i
    //var ii: UIImage
    //@IBOutlet weak var beerimage: UIImageView!
    //@IBOutlet weak var table: UITableView!
   // var ii: UIImage
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       // navigationItem.title = "Periodic Elements"
        
        elements = try! Element.loadFromPlist()
        elements.sort(by: {
            $0.no < $1.no
        })
        
       // let tableView = UITableView(frame: view.bounds)
      //  view.addSubview(tableView)
        //self.tableView = tableView
        
        table.dataSource = self
        table.delegate = self
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension TabviewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return elements.count
    }
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Getting the right element
        let element = elements[indexPath.row]
        var im: UIImage = UIImage()
        let imgURL: URL = URL(string: element.pic)!
        let request: URLRequest = URLRequest(url: imgURL)
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: {
            (data, response, error) -> Void in
            
            if (error == nil && data != nil)
            {
                func display_image()
                {
                    //self.image_element.image = UIImage(data: data!)
                    // return data
                    im = UIImage(data: data!)!
                }
                
                DispatchQueue.main.async(execute: display_image)
                
            }
            
        })
        
        task.resume()
        //im

        // Trying to reuse a cell
        let cellIdentifier = "BeerCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
            ?? UITableViewCell(style: .subtitle, reuseIdentifier: cellIdentifier)
        
        // Adding the right informations
        //display_image()
       // beerimage.image = im
        cell.textLabel?.text = element.beer
        cell.detailTextLabel?.text = element.price
        
        // Returning the cell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
 */
