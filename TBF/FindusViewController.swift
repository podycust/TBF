//
//  FindusViewController.swift
//  TBF
//
//  Created by Asa Bowes on 20/04/2017.
//  Copyright © 2017 Asa Bowes. All rights reserved.
//

import UIKit
import MapKit

class FindusViewController: UIViewController {

    @IBOutlet weak var dir: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        //let url = Bundle.main.url(forResource: "directions", withExtension: "html")
        //let request = URLRequest(url: url!)
        //dir.loadRequest(request)
        // Do any additional setup after loading the view.
        do
        {
            let testHTML = Bundle.main.path(forResource: "d", ofType: "html")
            
            let contents =  try NSString(contentsOfFile: testHTML!, encoding: String.Encoding.utf8.rawValue)
            let baseUrl = NSURL(fileURLWithPath: testHTML!) //for load css file
            
            dir.loadHTMLString(contents as String, baseURL: baseUrl as URL)
        }
        catch
        {
            
        }
        loadmap()
    }
    /*func loadHtmlCode() {
        let htmlCode = "<html> <body> <h4>Address</h4> <p>Thurrock Civic Hall, Blackshots Lane, Grays, RM16 2JU<br /><br /></p><h4 style="font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal;">Getting here</h4> <p>&nbsp;</p> <p><strong>Nearest Railway Station:</strong> Grays (1.9 miles), <a href="http://www.c2c-online.co.uk/" target="_blank">C2C</a><br /><br /><strong>Nearest Bus Stops:</strong> 'The Oak' Socketts Heath (Blackshots Leisure Centre) <br /><br /><strong>Bus Routes</strong> (NB: Some don't run in the evenings): <br /><strong>11</strong> (Aveley - Basildon, via Orsett) <br /><strong>73 [73A Evenings]</strong> (Lakeside - Tilbury) <br /><strong>83</strong> (Lakeside - Chadwell St Mary) <br /><strong>88</strong> (Grays - Lakeside, via Stifford Clays) <br /><strong>100</strong> (Lakeside - Chelmsford) <br /><strong>265</strong> (Grays - West Horndon) <br /><strong>374</strong> (Grays - Basildon, via East Tilbury) <br /><br />For further details/changes/other options, visit <a href="http://www.traveline.info/" target="_blank">TRAVELINE</a></p> </body> </html>"
        dir.loadHTMLString(htmlCode, baseURL: nil)
    }*/

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
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
        ann.title="Thurrock Civic Hall"
        map.addAnnotation(ann)
        map.showAnnotations(map.annotations, animated: true)
    }
    
    @IBOutlet weak var map: MKMapView!

}
