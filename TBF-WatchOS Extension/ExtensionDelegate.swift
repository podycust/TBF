//
//  ExtensionDelegate.swift
//  TBF-WatchOS Extension
//
//  Created by Asa Bowes on 12/10/2017.
//  Copyright © 2017 Asa Bowes. All rights reserved.
//

import WatchKit
import WatchConnectivity

class ExtensionDelegate: NSObject, WKExtensionDelegate, WCSessionDelegate {
   
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    func session(_ session: WCSession, didReceiveApplicationContext applicationContext: [String : Any]) {
       // var favbeerwatch = applicationContext["Favs"] as! Array<Any>
       // print(favbeerwatch)
        
    }
    
    func session(_ session: WCSession, didReceiveUserInfo userInfo: [String : Any] = [:]) {
        if (userInfo["Beers"] != nil) {
            beerswatch = userInfo["Beers"] as! Array<String>
            UserDefaults.standard.set(beerswatch, forKey: "watchbeers")
        }
        if (userInfo["Favs"] != nil) {
            favbeerswatch = userInfo["Favs"] as! Array<String>
            print(favbeerswatch)
            print("Fav Beers have reached watch")
            UserDefaults.standard.set(favbeerswatch, forKey: "watchfav")
            
        }
        if (userInfo["Type"] != nil) {
            watchfavtype = userInfo["Type"] as! Array<String>
            UserDefaults.standard.set(watchfavtype, forKey: "watchtype")
        }
    }
    
var session: WCSession!
    func applicationDidFinishLaunching() {
       session = WCSession.default
        session.delegate = self
        session.activate()
        let d = UserDefaults.standard
        let da = UserDefaults.standard.bool(forKey: "new")
        
        if !da {
            let a = [""]
            d.set(true, forKey: "new")
            d.set(a, forKey: "watchfav")
            d.set(a, forKey: "watchtype")
            d.set(a, forKey: "watchbeer")
        } else {
            watchfavtype = d.array(forKey: "watchtype") as! Array<String>
            favbeerswatch = d.array(forKey: "watchfav") as! Array<String>
            beerswatch = d.array(forKey: "watchbeers") as! Array<String>
        }
        // Perform any final initialization of your application.
    }
    
    func applicationDidBecomeActive() {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillResignActive() {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, etc.
    }

    func handle(_ backgroundTasks: Set<WKRefreshBackgroundTask>) {
        // Sent when the system needs to launch the application in the background to process tasks. Tasks arrive in a set, so loop through and process each one.
        for task in backgroundTasks {
            // Use a switch statement to check the task type
            switch task {
            case let backgroundTask as WKApplicationRefreshBackgroundTask:
                // Be sure to complete the background task once you’re done.
                backgroundTask.setTaskCompletedWithSnapshot(false)
            case let snapshotTask as WKSnapshotRefreshBackgroundTask:
                // Snapshot tasks have a unique completion call, make sure to set your expiration date
                snapshotTask.setTaskCompleted(restoredDefaultState: true, estimatedSnapshotExpiration: Date.distantFuture, userInfo: nil)
            case let connectivityTask as WKWatchConnectivityRefreshBackgroundTask:
                // Be sure to complete the connectivity task once you’re done.
                connectivityTask.setTaskCompletedWithSnapshot(false)
            case let urlSessionTask as WKURLSessionRefreshBackgroundTask:
                // Be sure to complete the URL session task once you’re done.
                urlSessionTask.setTaskCompletedWithSnapshot(false)
            default:
                // make sure to complete unhandled task types
                task.setTaskCompletedWithSnapshot(false)
            }
        }
    }

}
