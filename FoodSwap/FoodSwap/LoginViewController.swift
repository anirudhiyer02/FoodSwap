//
//  LoginViewController.swift
//  Final
//
//  Created by Ananth Goyal on 1/16/19.
//  Copyright © 2019 Ananth Goyal. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userEmailTextField: UITextField!
    
    @IBOutlet weak var userPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func loginButtonTapped(_ sender: Any) {
       
    
        let userEmail = userEmailTextField.text;
        let userPassword = userPasswordTextField.text;
        let userEmailStored = UserDefaults.standard.string(forKey: "userEmail")
        let userPasswordStored = UserDefaults.standard.string(forKey:
            "userPassword")
        let userAccountStored = UserDefaults.standard.integer(forKey: "userAccount")
        
        if(userEmailStored == userEmail){
            if(userPasswordStored == userPassword){

                //Login is successful
                UserDefaults.standard.set(true, forKey: "isUserLoggedIn");
                UserDefaults.standard.synchronize();
                self.dismiss(animated: true, completion: nil);
                //self.performSegue(withIdentifier: "loginView", sender: self)
                //self.performSegue(withIdentifier: "loginView", sender: self)
                if(userAccountStored == 0){
                    self.performSegue(withIdentifier: "loginView", sender: self)
                }
                else if(userAccountStored == 1){
                    self.performSegue(withIdentifier: "shelterView", sender: self)
                }
                else if(userAccountStored == 2){
                    self.performSegue(withIdentifier: "volunteerView", sender: self)
                }
                
                
            }
            else{
                displayMyAlertMessage(userMessage: "UserName or Password is Incorrect!")
                return;
                
            }
            
        }
        
        
        
    }
    func displayMyAlertMessage(userMessage:String){
        
        var myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertController.Style.alert)
        
        let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil);
        
        myAlert.addAction(okAction);
        self.present(myAlert, animated: true, completion: nil)
    }
    
    func reportLocationServicesDeniedError(){
        let alert = UIAlertController(title: "Location Services is Disabled", message: "Please go to settings and activate it", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    

}
