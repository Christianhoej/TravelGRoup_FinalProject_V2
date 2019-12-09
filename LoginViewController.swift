//
//  LoginViewController.swift
//  Travel_Project
//
//  Created by Hoej, Christian R on 12/4/19.
//  Copyright © 2019 Hoej, Christian R. All rights reserved.
//

import UIKit
import CoreData
import os.log


class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signupUsernameTextfield: UITextField!
    @IBOutlet weak var signupPasswordTextfield: UITextField!

    @IBOutlet weak var wrongLabel: UILabel!

    @IBOutlet weak var signupButton: UIButton!
    
    @IBOutlet weak var loginButton: UIButton!
    
    var users: [NSManagedObject] = []
    
    var userOK:Bool = false
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func buttonAct(sender: UIButton){
        switch sender {
        case loginButton:
            print("Login")
                checkUser()
                print("USEROK")
                print(userOK)
                if (userOK == false){
                    wrongLabel.isHidden=false
                    wrongLabel.pulsate()
                     }
                     else{
                        performSegue(withIdentifier: "loginSegue", sender: nil)
                         print("login!!!")
                 }
        case signupButton:
            print("signup")
            wrongLabel.isHidden=true
            performSegue(withIdentifier: "signupSegue", sender: nil)
            
        default:
            print("Default")
        }
    }
    
    
    
        
        /*if (usernameTextField.text?.trimmingCharacters(in: .whitespaces).isEmpty ?? true) || (passwordTextField.text?.trimmingCharacters(in: .whitespaces).isEmpty ?? true) {
            //noUser()
            /*let alert = UIAlertController(title: "No input", message: "Please enter a valid username and password", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true)*/
        }
        else{*/
   
 
    
    func checkUser(){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
          return
        }
          
        let managedContext = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        request.returnsObjectsAsFaults = false
        do {
            let result = try managedContext.fetch(request)
            for data in result as! [NSManagedObject] {
                if (data.value(forKey: "username") as? String == usernameTextField.text){
                    userOK = true
                    print("USER OK2")
                    print(userOK)
                }
          }
            
        } catch {
            print("Failed")
        }
    }
 /*
    //Fetching the core data
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
      
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "User")

        do {
            users = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
    }
    */
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
