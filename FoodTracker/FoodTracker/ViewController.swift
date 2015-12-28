//
//  ViewController.swift
//  FoodTracker
//
//  Created by dmisin on 12/22/15.
//  Copyright © 2015 GZS. All rights reserved.
//

import UIKit

class ViewController
    : UIViewController
    , UITextFieldDelegate
    , UIImagePickerControllerDelegate
    , UINavigationControllerDelegate
{
    // MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    
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
    
    // MARK: UINavigationControllerDelegate
    func imagePickerControllerDidCancel(picker: UIImagePickerController)
    {
        dismissViewControllerAnimated(true, completion: nil);
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject])
    {
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage;
        photoImageView.image = selectedImage;
        dismissViewControllerAnimated(true, completion: nil);
    }
    
    // MARK: Actions
    @IBAction func selectImageFromPhotoLibrary(sender: UITapGestureRecognizer)
    {
        nameTextField.resignFirstResponder();
        let imagePickerController = UIImagePickerController();
        imagePickerController.sourceType = .PhotoLibrary;
        imagePickerController.delegate = self;
        presentViewController(imagePickerController, animated: true, completion: nil)
        
    }
    @IBAction func setDefaultLabelText(sender: UIButton)
    {
        mealNameLabel.text = "Default Text";
    }
}





