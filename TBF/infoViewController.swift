//
//  infoViewController.swift
//  TBF
//
//  Created by Asa Bowes on 28/07/2017.
//  Copyright © 2017 Asa Bowes. All rights reserved.
//

import UIKit

class infoViewController: UIViewController {


    @IBOutlet weak var brewer: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var abv: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var des: UILabel!
    
    var n = ""
    var l = ""
    var b = ""
    var a = ""
    var t = ""
    var d = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
//name.text = n
        location.text = l
        des.text = d
        abv.text = a
        type.text = t
        brewer.text = b
        des.sizeToFit()
        // Do any additional setup after loading the view.
        self.navigationItem.title = n
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
