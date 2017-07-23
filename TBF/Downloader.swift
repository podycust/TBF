//
//  Downloader.swift
//  TBF
//
//  Created by Asa Bowes on 11/06/2017.
//  Copyright © 2017 Asa Bowes. All rights reserved.
//

import Foundation

public class Downloader {
    class func load(url: URL, to localUrl: URL) /*, completion: @escaping () -> ()) */{
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
                   let s = u + "test.csv"
                    let g = URL(string: s)
                   
                    try FileManager.default.copyItem(at: tempLocalUrl, to: g!)
                    
                   // completion()
                } catch (let writeError) {
                    print("error writing file \(localUrl) : \(writeError)")
                }
                
            } else {
                print("Failure: %@", error?.localizedDescription);
            }
        }
        task.resume()
    }
    }

struct beers {
    var beer: Array<Any>
    let type: Array<Any>
    let Description: Array<Any>
    let ABV: Array<Any>
    var t:String
    static func load() {
        var path = try! FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true).absoluteString
        path += "test.csv"
        let to = URL(fileURLWithPath: path)
        let urls = URL(string: "https://www.bowesgames.co.uk/app/pdf/test.csv")
        Downloader.load(url: urls!, to: to)
       
    }
    
    public func beer(row: Int)-> Array<Any>{
        return [beer[row]]
    }
    
    public func ABV (row: Int)->Array<Any>{
        return [ABV[row]]
    }
    
    public func type(row: Int)->Array<Any>{
        return [type[row]]
    }
    public func description (row:Int) -> Array<Any> {
        return [Description[row]]
    }
}
