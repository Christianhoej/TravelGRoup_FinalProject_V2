//
//  signUpViewController.swift
//  Travel_Project
//
//  Created by Hoej, Christian R on 12/9/19.
//  Copyright © 2019 Hoej, Christian R. All rights reserved.
//

import UIKit
import CoreData
import os.log

class signUpViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var signUpPressed: UIButton!
    
    var users: [NSManagedObject] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signUpPressed(_ sender: Any) {
        if (username.text?.trimmingCharacters(in: .whitespaces).isEmpty ?? true) || (password.text?.trimmingCharacters(in: .whitespaces).isEmpty ?? true) {
                let alert = UIAlertController(title: "No input", message: "Please enter a valid username and password", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alert, animated: true)
            print("SIGNUPFEJL")
            }
            else {
        addUser(username: username.text!, password: password.text!)
            let alert2 = UIAlertController(title: "Done!", message: "Go back and log in", preferredStyle: .alert)
            alert2.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert2, animated: true)
            }
    }
    
    func addUser(username: String, password: String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
          return
        }
          
        let managedContext = appDelegate.persistentContainer.viewContext

        let entity = NSEntityDescription.entity(forEntityName: "User", in: managedContext)!
        
        let user = NSManagedObject(entity: entity, insertInto: managedContext)
        
        user.setValue(username, forKey: "username")
        user.setValue(password, forKey: "password")
        
        do {
            try managedContext.save()
            users.append(user)
        } catch {
            let nserror = error as NSError
            NSLog("Unable to save \(nserror), \(nserror.userInfo)")
            abort()
        }
    }
}
