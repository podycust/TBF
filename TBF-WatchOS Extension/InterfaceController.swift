//
//  InterfaceController.swift
//  TBF-WatchOS Extension
//
//  Created by Asa Bowes on 12/10/2017.
//  Copyright © 2017 Asa Bowes. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class InterfaceController: WKInterfaceController, WCSessionDelegate {
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func session(_ session: WCSession, didReceiveUserInfo userInfo: [String : Any] = [:]) {
        favstable.setNumberOfRows(favbeerswatch.count, withRowType: "favrow")
        
        for i in 0..<favbeerswatch.count {
            if let row = favstable.rowController(at: i) as? WatchFavRowController {
                let t = Int(favbeerswatch[i])
                row.wfb.setText(beerswatch[t!])
                if watchfavtype[i] == "Golden"{
                    row.wbt.setImage(UIImage(named: "golden"))
                }
                if watchfavtype[i] == "Amber"{
                    row.wbt.setImage(UIImage(named: "amber"))
                }
                if watchfavtype[i] == "Porter" {
                    row.wbt.setImage(UIImage(named: "porter"))
                }
                if watchfavtype[i] == "Pale" {
                    row.wbt.setImage(UIImage(named: "pale"))
                }
                if watchfavtype[i] == "Ruby" {
                    row.wbt.setImage(UIImage(named: "ruby"))
                }
                if watchfavtype[i] == "Stout" {
                    row.wbt.setImage(UIImage(named: "stout"))
                }
                if watchfavtype[i] == "Dark" {
                    row.wbt.setImage(UIImage(named: "dark"))
                }
                
                if watchfavtype[i] == "Brown" {
                    row.wbt.setImage(UIImage(named: "brown"))
                }
            }
        }
    }
    @IBOutlet var favstable: WKInterfaceTable!
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
        favstable.setNumberOfRows(favbeerswatch.count, withRowType: "favrow")
        
        for i in 0..<favbeerswatch.count {
            if let row = favstable.rowController(at: i) as? WatchFavRowController {
              let t = Int(favbeerswatch[i])
                row.wfb.setText(beerswatch[t!])
                if watchfavtype[i] == "Golden"{
                    row.wbt.setImage(UIImage(named: "golden"))
                }
                if watchfavtype[i] == "Amber"{
                    row.wbt.setImage(UIImage(named: "amber"))
                }
                if watchfavtype[i] == "Porter" {
                    row.wbt.setImage(UIImage(named: "porter"))
                }
                if watchfavtype[i] == "Pale" {
                    row.wbt.setImage(UIImage(named: "pale"))
                }
                if watchfavtype[i] == "Ruby" {
                    row.wbt.setImage(UIImage(named: "ruby"))
                }
                if watchfavtype[i] == "Stout" {
                    row.wbt.setImage(UIImage(named: "stout"))
                }
                if watchfavtype[i] == "Dark" {
                    row.wbt.setImage(UIImage(named: "dark"))
                }
                
                if watchfavtype[i] == "Brown" {
                    row.wbt.setImage(UIImage(named: "brown"))
                }
        }
    }
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        favstable.setNumberOfRows(favbeerswatch.count, withRowType: "favrow")
        
        for i in 0..<favbeerswatch.count {
            if let row = favstable.rowController(at: i) as? WatchFavRowController {
                let t = Int(favbeerswatch[i])
                row.wfb.setText(beerswatch[t!])
                if watchfavtype[i] == "Golden"{
                    row.wbt.setImage(UIImage(named: "golden"))
                }
                if watchfavtype[i] == "Amber"{
                    row.wbt.setImage(UIImage(named: "amber"))
                }
                if watchfavtype[i] == "Porter" {
                    row.wbt.setImage(UIImage(named: "porter"))
                }
                if watchfavtype[i] == "Pale" {
                    row.wbt.setImage(UIImage(named: "pale"))
                }
                if watchfavtype[i] == "Ruby" {
                    row.wbt.setImage(UIImage(named: "ruby"))
                }
                if watchfavtype[i] == "Stout" {
                    row.wbt.setImage(UIImage(named: "stout"))
                }
                if watchfavtype[i] == "Dark" {
                    row.wbt.setImage(UIImage(named: "dark"))
                }
                
                if watchfavtype[i] == "Brown" {
                    row.wbt.setImage(UIImage(named: "brown"))
                }
            }
        }
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
}
