//
//  SettingsViewcontrollerViewController.swift
//  Travel_Project
//
//  Created by Hoej, Christian R on 12/9/19.
//  Copyright © 2019 Hoej, Christian R. All rights reserved.
//

import UIKit

class SettingsViewcontrollerViewController: UIViewController {

    @IBOutlet weak var logoutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    var loginViewController = LoginViewController()
    
    @IBAction func buttonAct(sender: UIButton){
        switch sender {
        
        case logoutButton:
            print("LOGOUT")
            self.navigationController?.popToRootViewController(animated: true)
            loginViewController.userOK = false
        default:
            print("Default")
        }
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
