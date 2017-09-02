//
//  Downloader.swift
//  TBF
//
//  Created by Asa Bowes on 11/06/2017.
//  Copyright © 2017 Asa Bowes. All rights reserved.
//

import Foundation

public class Downloader {
    class func load(url: URL, to localUrl: URL, f: String) /*, completion: @escaping () -> ()) */{
        let sessionConfig = URLSessionConfiguration.default
        let session = URLSession(configuration: sessionConfig)
        let request = URLRequest(url: url)
        
        let task = session.downloadTask(with: request) { (tempLocalUrl, response, error) in
            if let tempLocalUrl = tempLocalUrl, error == nil {
                // Success
                if let statusCode = (response as? HTTPURLResponse)?.statusCode {
                    print("Success: \(statusCode)")
                }
                
                do {
                    let u = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).absoluteString
                   let s = u + f
                    let g = URL(string: s)
                  // let g = localUrl
                    if f == "fav.xml" {
                        favlo = (g?.absoluteString)!
                        print(favlo)
                    }
                    if f == "beers.xml" {
                        try? FileManager.default.removeItem(at: (g)!)
                    }
                    try FileManager.default.copyItem(at: tempLocalUrl, to: g!)
                    
                   // completion()
                } catch (let writeError) {
                    print("error writing file \(localUrl) : \(writeError)")
                }
                
            } else {
                print("Failure: %@", error as Any);
            }
        }
        task.resume()
    }
    }

public class loader {
    
    class func loadbeers() {
        var path = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).absoluteString
        path += "beers.xml"
        let s = "beers.xml"
        let to = URL(fileURLWithPath: path)
        let urls = URL(string: "https://www.bowesgames.co.uk/app/beers.xml")
        Downloader.load(url: urls!, to: to, f: s)
      
       
    }
    
    
    class func loadbeersforfav() {
        var path = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).absoluteString
        path += "fav.xml"
        let to = URL(fileURLWithPath: path)
        let urls = URL(string: "https://www.bowesgames.co.uk/app/fav.xml")
        let s = "fav.xml"
        Downloader.load(url: urls!, to: to, f: s)
       
    }
    
}
