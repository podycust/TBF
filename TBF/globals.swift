//
//  globals.swift
//  TBF
//
//  Created by Asa Bowes on 27/08/2017.
//  Copyright © 2017 Asa Bowes. All rights reserved.
//

import Foundation
import Alamofire

var beers = Array<String>()
var brewer = Array<String>()
var location = Array<String>()
var type = Array<String>()
var abv = Array<String>()
var des = Array<String>()
var favbeers = Array<String>()
var favbrewer = Array<String>()
var favlocation = Array<String>()
var favtype = Array<String>()
var favabv = Array<String>()
var favdes = Array<String>()
var favlo = String()
var favstore = Array<Any>()
var phonefav = Array<Any>()
public class connected1 {
    public var isconnected:Bool {
        return (NetworkReachabilityManager()?.isReachable)!
    }
}
