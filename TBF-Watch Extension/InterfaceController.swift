//
//  InterfaceController.swift
//  TBF-Watch Extension
//
//  Created by Asa Bowes on 05/08/2017.
//  Copyright © 2017 Asa Bowes. All rights reserved.
//

import WatchKit
import Foundation



class InterfaceController: WKInterfaceController {
   
    @IBOutlet var t: WKInterfaceTable!
    var beer = Array<Any>()
   
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        if let watch = UserDefaults(suiteName: "group.tbf.watch") {
            //watch.synchronize()
            if watch.array(forKey: "beer") != nil {
                
                beer = watch.array(forKey: "beer")!
                
            }
            print(beer.count)
        } else {
            print("Error")
        }
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    func loadtable() {
    t.setNumberOfRows(beer.count, withRowType: "beer")
        
    }
        
}
