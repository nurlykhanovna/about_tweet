//
//  ViewController.swift
//  quickTweet
//
//  Created by Alima Seytkan on 6/28/18.
//  Copyright © 2018 moon inc. All rights reserved.

import UIKit
import Social

class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var genderSegmentControl: UISegmentedControl!
    @IBOutlet weak var birthDatePickerVIew: UIDatePicker!
    @IBOutlet weak var workTextField: UITextField!
    @IBOutlet weak var salarySlider: UISlider!
    @IBOutlet weak var salaryLabel: UILabel!
    @IBOutlet weak var familyStatusSwitch: UISwitch!
    
    var nameText:String?
    var gender:String?
    var work:String?
    var familyStatus:String?
    var mySalary:String?
    var myAge: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //get age
    func age(dateOfBirth: Date) -> Double {
        var ageComponents: DateComponents = Calendar.current.dateComponents([.year], from: dateOfBirth, to: Date())
        return Double(ageComponents.year!)
    }
    
    @IBAction func dateDidChange(_ sender: UIDatePicker) {
        myAge = "\(age(dateOfBirth: sender.date))"
    }
    
    //MARK:SalaryButton release
    @IBAction func salaryUIslider(_ sender: UISlider) {
        let salary = Int(salarySlider.value)
        salaryLabel.text = "$" + "\(salary)" + "K"
        mySalary = String(salary)
        
    }
    
    //MARK:FamilyStatusButton release
    @IBAction func familyStatusSwitchBTN(_ sender: Any) {
        if familyStatusSwitch.isOn {
            familyStatus = "I have a family"
        } else {
            familyStatus = "I don`t have a family"
        }
    }
    

    //MARK: tweetButton release
    @IBAction func tweetBTNpressed(_ sender: UIButton) {
        nameText = nameTextField.text
        work = workTextField.text
        
        if genderSegmentControl.selectedSegmentIndex == 0 {
            gender = "Male"
        } else if genderSegmentControl.selectedSegmentIndex == 1 {
            gender = "Female"
        }
        
        if (nameText != nil && nameTextField != nil && work != nil && gender != nil && mySalary != nil && familyStatus != nil) {
            
            let alert = UIAlertController(title:"About \(nameText!)", message: "My name is \(nameText!), i am \(myAge!), \(gender!), My occupation is \(work!), My salary is: \(mySalary!)k $, And \(familyStatus!)", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Okay", style: .default, handler:
                { (action) in
                    self.dismiss(animated: true, completion: nil)
            }))
            
            present(alert, animated: true, completion: nil)
            
        } else {
            
            let alert = UIAlertController(title:"Correct all fils!", message: "You should fill all sections", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Again", style: .default, handler:
                { (action) in
                    self.dismiss(animated: true, completion: nil)
            }))
            
            present(alert, animated: true, completion: nil)
            
        }

        
        
    }

}

