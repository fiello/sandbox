//
//  MealViewController.swift
//  FoodTracker
//
//  Created by dmisin on 12/22/15.
//  Copyright © 2015 GZS. All rights reserved.
//

import UIKit

class MealViewController
    : UIViewController
    , UITextFieldDelegate
    , UIImagePickerControllerDelegate
    , UINavigationControllerDelegate
{
    // MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var ratingControl: RatingControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //assign delegate to handle user input events from a text field
        nameTextField.delegate = self;
    }

    // MARK: UITextFieldDelegate
    func textFieldDidEndEditing(textField: UITextField)
    {
        
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
}





