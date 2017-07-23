//
//  Element.swift
//  ElementsList
//
//  Created by Thomas Durand on 06/08/2016.
//  Copyright © 2016 Thomas Durand. All rights reserved.
//

import Foundation

struct Element {
    enum State: String {
        case Solid, Liquid, Gas, Artificial
    }
    
    let beer: String
    let price: String
    let pic: String
    let no: Int
    // Position in the table
   // let horizPos: Int
    //let vertPos: Int
}


extension Element {
    enum ErrorType: Error {
        case noPlistFile
        case cannotReadFile
    }
    
    /// Load all the elements from the plist file
    static func loadFromPlist() throws -> [Element] {
        // First we need to find the plist
        //var im: UIImage = UIImage()
        let imgURL: URL = URL(string: "http://www.bowesgames.co.uk/tbf/beer.plist")!
        var f = ""
        DispatchQueue.global().async {
           let list = try? String(contentsOf: URL(string: "http://www.bowesgames.co.uk/tbf/beer.plist")!)
            //f = list!
        }
        
       /* guard let file = Bundle.main.path(forResource: "Elements", ofType: "plist") else {
            throw ErrorType.noPlistFile
        }*/
       
 
        let nsDocumentDirectory:FileManager.SearchPathDirectory = FileManager.SearchPathDirectory.documentDirectory
        
        let nsUserDomainMask:FileManager.SearchPathDomainMask = FileManager.SearchPathDomainMask.userDomainMask;
        
        let paths:[String] = NSSearchPathForDirectoriesInDomains(nsDocumentDirectory, nsUserDomainMask, true);
        
        if (paths.count > 0) {
            
            let folderPath:String = String(paths[0]);
            
            print(folderPath);
            f = folderPath + "/beer.plist"
            
        }

        // Then we read it as an array of dict
        guard let array = NSArray(contentsOfFile: f) as? [[String: AnyObject]] else {
            throw ErrorType.cannotReadFile
        }
        
        // Initialize the array
        var elements: [Element] = []
        
        // For each dictionary
        for dict in array {
            // We implement the element
            let element = Element.from(dict: dict)
            // And add it to the array
            elements.append(element)
        }
        
        // Return all elements
        return elements
    }
    
    /// Create an element corresponding to the given dict
    static func from(dict: [String: AnyObject]) -> Element {
        let beer = dict["Beer"] as! String
        let price = dict["Price"] as! String
        let pic = dict["pic"] as! String
        //let atomicNumber = dict["atomicNumber"] as! Int
       // let atomicWeight = Float(dict["atomicWeight"] as! String) ?? 0
       // let discoveryYear = dict["discoveryYear"] as! String
        //let group = dict["group"] as! Int
        //let name = dict["name"] as! String
        //let period = dict["period"] as! Int
        //let radioactive = dict["radioactive"] as! String == "True"
        //let state = State(rawValue: dict["state"] as! String)!
        //let symbol = dict["symbol"] as! String
        //let horizPos = dict["horizPos"] as! Int
       // let vertPos = dict["vertPos"] as! Int
        let no = dict["no"] as! Int
        return Element(
                       beer: beer,
                       price: price,
                       pic: pic,
                       no: no
                       )
    }
}
