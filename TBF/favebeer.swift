//
//  favebeer.swift
//  TBF
//
//  Created by Asa Bowes on 30/07/2017.
//  Copyright © 2017 Asa Bowes. All rights reserved.
//

import Foundation
import CoreData
import AEXML

class favoo{
   static var b = Array<Bool>()
    
}

public class Favbeers: NSManagedObjectContext {
    @NSManaged  var brewer : String
    @NSManaged  var location : String
    @NSManaged  var type : String
    @NSManaged  var abv : String
    @NSManaged  var des : String
    @NSManaged  var beer : String
}


public class DataHelper {
    let context: NSManagedObjectContext
    
    init(context: NSManagedObjectContext) {
        self.context = context
    }
    
    public func seedDataStore() {
        
}
    
  /*  fileprivate func seedZoos() {
        let zoos = [
            (name: "Oklahoma City Zoo", location: "Oklahoma City, OK"),
            (name: "Lowry Park Zoo", location: "Tampa, FL"),
            (name: "San Diego Zoo", location: "San Diego, CA")
        ]
        
        for zoo in zoos {
            let newZoo = NSEntityDescription.insertNewObject(forEntityName: "Favbeers", into: context) as! Favbeers
            newZoo.name = zoo.name
            newZoo.location = zoo.location
        }
        
        do {
            try context.save()
        } catch _ {
        }
    }
}*/
