//
//  RegisterPageViewController.swift
//  Final
//
//  Created by Ananth Goyal on 1/16/19.
//  Copyright © 2019 Ananth Goyal. All rights reserved.
//

import UIKit

class RegisterPageViewController: UIViewController {

    @IBOutlet weak var userEmailTextField: UITextField!
    
    @IBOutlet weak var userPasswordTextField: UITextField!
    
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    
    @IBOutlet weak var AccountTypeBox: UISegmentedControl!
    //dummy
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        
        

        // Do any additional setup after loading the view.
    }
    

    @IBAction func registerButtonTapped(_ sender: Any) {
        
        let userEmail = userEmailTextField.text
        let userPassword = userPasswordTextField.text
        let userRepeatPassword = repeatPasswordTextField.text
        let userAccountTypeInt = AccountTypeBox.selectedSegmentIndex
        
        //var userAccount = "";
        //var userAccount = "";
        
        /*if(userAccountTypeInt == 0){
            userAccount = "Restaurant";
        }
        else if(userAccountTypeInt == 1){
            userAccount = "Shelter";
        }
        else if(userAccountTypeInt == 2){
            userAccount = "Volunteer";
        }*/
        
        //Check for empty fields
        if (userEmail?.isEmpty == true || userPassword?.isEmpty == true || userRepeatPassword?.isEmpty == true){
            displayMyAlertMessage(userMessage: "All Fields Required!");
            //Display Alert
           return;
        }
        //Check if passwords math
        if (userPassword != userRepeatPassword){
           //Display Alert
            displayMyAlertMessage(userMessage: "Passwords Must Match!");
            return;
        }
        
        //Store Data
        UserDefaults.standard.set(userEmail, forKey:"userEmail");
        UserDefaults.standard.set(userPassword, forKey:"userPassword");
        UserDefaults.standard.set(userAccountTypeInt, forKey: "userAccount")
        UserDefaults.standard.synchronize();
        
        
        
        //Display Alert Message with Confirmation
        
        var myAlert = UIAlertController(title: "Alert", message: "Registration is Successful", preferredStyle: UIAlertController.Style.alert)
        
        let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default){action in
            self.dismiss(animated: true, completion: nil)
        }
        
        myAlert.addAction(okAction);
        self.present(myAlert, animated: true, completion: nil)
        
    }
    
    func displayMyAlertMessage(userMessage:String){
        
        var myAlert = UIAlertController(title: "Alert", message: userMessage, preferredStyle: UIAlertController.Style.alert)
        
        let okAction = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil);
        
        myAlert.addAction(okAction);
        self.present(myAlert, animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
        
        
        
    
    
}
