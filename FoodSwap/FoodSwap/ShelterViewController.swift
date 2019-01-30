//
//  ShelterViewController.swift
//  Final
//
//  Created by Ananth Goyal on 1/21/19.
//  Copyright © 2019 Ananth Goyal. All rights reserved.
//

import UIKit
import Firebase
import MessageUI




class ShelterViewController: UIViewController,  MFMessageComposeViewControllerDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        switch (result) {
        case .cancelled:
            print("Message was cancelled")
            dismiss(animated: true, completion: nil)
        case .failed:
            print("Message failed")
            dismiss(animated: true, completion: nil)
        case .sent:
            print("Message was sent")
            dismiss(animated: true, completion: nil)
        default:
            break
        }
    }
    
    
    private var datePicker: UIDatePicker?
    private var restaurantPicker: UIPickerView?
    var restuarantName: String?
    
    //let italicFont = UIFont.preferredFont(forTextStyle: .footnote).italic()
    
    
    
    @IBAction func sendMessage(_ sender: Any) {
        let messageVC = MFMessageComposeViewController()
        
        messageVC.body = "\nDelivery " + inputTextField.text! + "\nNumber of Meals: " + numMealField.text! + "\nSpecial Requests: " + additonalField.text! + "\n\n\nSent via FoodSwap"
        messageVC.recipients = ["9259157827"]
        messageVC.messageComposeDelegate = self
        
        self.present(messageVC, animated: true, completion: nil)
        
    }
    
    @IBOutlet weak var inputTextField: UITextField!
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    //@IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var numMealField: UITextField!
    
    @IBOutlet weak var additonalField: UITextField!
    
    let foods = ["Restaurant 1", "Restaurant 2", "Restaurant 3"]
    //let check = UserDefaults.string(forKey: "userEmail")
    
    //let test = [check[0].text, check[1].text, "Hello"]
    //let array = defaults.object(forKey:"SavedArray") as? [String] ?? [String]()
    //UserDefaults.standard.set(numMealField.text, forKey:"userEmail");
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker = UIDatePicker()
        pickerView.layer.borderColor = UIColor.gray.cgColor
        pickerView.layer.borderWidth = 1
        
        
        
        datePicker?.datePickerMode = .time;
        datePicker?.addTarget(self, action: #selector(ShelterViewController.dateChanged(datePicker:)), for: .valueChanged)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ShelterViewController.viewTapped(gestureRecognizer:)))
        view.addGestureRecognizer(tapGesture)
        
        inputTextField.inputView = datePicker
        //restaurantField.inputView = restaurantPicker
        // Do any additional setup after loading the view.
    }
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer){
        
        view.endEditing(true)
    }
    
    @objc func dateChanged(datePicker: UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "'Time:' hh:mm"
        inputTextField.text = dateFormatter.string(from: datePicker.date)
        view.endEditing(true)
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return foods[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return foods.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        restuarantName = foods[row]
    }
    
    
    
    
    
}
extension UIFont {
    func withTraits(traits:UIFontDescriptor.SymbolicTraits) -> UIFont {
        let descriptor = fontDescriptor.withSymbolicTraits(traits)
        return UIFont(descriptor: descriptor!, size: 0) //size 0 means keep the size as it is
    }
    
    func bold() -> UIFont {
        return withTraits(traits: .traitBold)
    }
    
    func italic() -> UIFont {
        return withTraits(traits: .traitItalic)
    }
}

