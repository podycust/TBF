//
//  mapview.swift
//  TBF
//
//  Created by Asa Bowes on 16/04/2017.
//  Copyright © 2017 Asa Bowes. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    @IBOutlet weak var dir: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //lets setup the map :)
        loadmap()
       /* let attributedString = NSMutableAttributedString(string: "Want to learn iOS? You should visit the best source of free iOS tutorials!")
        attributedString.addAttribute(NSLinkAttributeName, value: "https://www.hackingwithswift.com", range: NSRange(location: 19, length: 55))
        dir.attributedText = attributedString */
        do
        {
            let testHTML = Bundle.main.path(forResource: "d", ofType: "html")
            
            let contents =  try NSString(contentsOfFile: testHTML!, encoding: String.Encoding.utf8.rawValue)
            let baseUrl = NSURL(fileURLWithPath: testHTML!) //for load css file
            
            web.loadHTMLString(contents as String, baseURL: baseUrl as URL)
        }
        catch
        {
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //Logic to setup mapkit
    @IBOutlet weak var web: UIWebView!
  func loadmap()
    
  {
    //set coordinates for MapKit
    let location = CLLocationCoordinate2D(latitude: 51.491618, longitude: 0.342347)
    let span = MKCoordinateSpanMake(0.05, 0.05)
    let region = MKCoordinateRegion(center: location, span: span)
    map.setRegion(region, animated: true)
    map.mapType = MKMapType.standard
    let ann = MKPointAnnotation()
    ann.coordinate=location
    ann.title="Civic Hall"
    map.addAnnotation(ann)
    map.showAnnotations(map.annotations, animated: true)
    }
    //ref to mapkitcontrol on the mapview storyboard
    @IBOutlet weak var map: MKMapView!
}
