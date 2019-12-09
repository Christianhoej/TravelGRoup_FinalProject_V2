//
//  DisplayViewContoller.swift
//  Travel_Project
//
//  Created by Hoej, Christian R on 11/25/19.
//  Copyright © 2019 Hoej, Christian R. All rights reserved.
//

import UIKit

class DisplayViewContoller: UIViewController{
    @IBOutlet weak var populationLabel: UILabel!
    @IBOutlet weak var capitalLabel: UILabel!
    @IBOutlet weak var languagesLabel: UILabel!
    @IBOutlet weak var regionLabel: UILabel!
    @IBOutlet weak var governmentLabel: UILabel!
    @IBOutlet weak var areaLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var gdpLabel: UILabel!
    @IBOutlet weak var countryNameLabel: UILabel!
    
    var countryName:String = "DEFAULT"
    
    var dataSession = Countrydata()
 
    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        
        // Do any additional setup after loading the view.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
