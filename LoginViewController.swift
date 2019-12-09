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
    @IBOutlet weak var loginBtn: UIButton!
    var users: [NSManagedObject] = []
    
    var userOK:Bool = false
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginPressed(_ sender: Any) {
        //if usernameTextField == users.
        
        /*if (usernameTextField.text?.trimmingCharacters(in: .whitespaces).isEmpty ?? true) || (passwordTextField.text?.trimmingCharacters(in: .whitespaces).isEmpty ?? true) {
            //noUser()
            /*let alert = UIAlertController(title: "No input", message: "Please enter a valid username and password", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true)*/
        }
        else{*/
   /*         checkUser()
            print("USEROK")
            print(userOK)
            if (userOK == false){
                /*let alert1 = UIAlertController(title: "No input", message: "Please enter a valid username and password", preferredStyle: .alert)
                alert1.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alert1, animated: true)*/
                // the alert view
                let alert = UIAlertController(title: "", message: "alert disappears after 5 seconds", preferredStyle: .alert)
                self.present(alert, animated: true, completion: nil)

                // change to desired number of seconds (in this case 5 seconds)
                let when = DispatchTime.now() + 1
                DispatchQueue.main.asyncAfter(deadline: when){
                  // your code with delay
                  alert.dismiss(animated: true, completion: nil)
                }
                
            }
            else{
                print("login!!!")
            }
            //if (usernameTextField.text)*/
        }

    //}
    

 
    
    
    
    func checkUser(){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
          return
        }
          
        let managedContext = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        //request.predicate = NSPredicate(format: "age = %@", "12")
        request.returnsObjectsAsFaults = false
        do {
            let result = try managedContext.fetch(request)
            for data in result as! [NSManagedObject] {
                if (data.value(forKey: "username") as? String == usernameTextField.text){
                    userOK = true
                    print("USER OK2")
                    print(userOK)
                }
                else {
                    //noUser()
                }
          }
            
        } catch {
            
            print("Failed")
        }
    }
 /*
    func noUser(){
        let alert = UIAlertController(title: "No input", message: "Please enter a valid username and password", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true)
    }
    */
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
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
