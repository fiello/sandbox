//
//  ViewController.swift
//  FoodTracker
//
//  Created by dmisin on 12/22/15.
//  Copyright © 2015 GZS. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate
{
    // MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mealNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //assign delegate to handle user input events from a text field
        nameTextField.delegate = self;
    }

    // MARK: UITextFieldDelegate
    func textFieldDidEndEditing(textField: UITextField)
    {
        mealNameLabel.text = textField.text;
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        // resign from editing and hide keyboard
        textField.resignFirstResponder();
        return true;
    }
    
    // MARK: Actions
    @IBAction func setDefaultLabelText(sender: UIButton)
    {
        mealNameLabel.text = "Default Text";
    }
}





