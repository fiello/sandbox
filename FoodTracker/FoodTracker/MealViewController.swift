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
    @IBOutlet weak var saveButton: UIBarButtonItem!
    /*
    This value is either passed by `MealTableViewController` in `prepareForSegue(_:sender:)`
    or constructed as part of adding a new meal.
    */
    var meal: Meal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //assign delegate to handle user input events from a text field
        nameTextField.delegate = self;
        if let meal = meal {
            navigationItem.title = meal.name;
            nameTextField.text = meal.name;
            photoImageView.image = meal.photo;
            ratingControl.rating = meal.rating;
        }
        
        checkValidMealName();
    }

    // MARK: UITextFieldDelegate
    func textFieldDidEndEditing(textField: UITextField)
    {
        checkValidMealName();
        navigationItem.title = textField.text;
    }
    func textFieldDidBeginEditing(textField: UITextField)
    {
        saveButton.enabled = false;
    }
    func checkValidMealName ()
    {
        let text = nameTextField.text ?? "";
        saveButton.enabled = !text.isEmpty;
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
    
    // MARK: Navigation
    @IBAction func cancel(sender: AnyObject)
    {
        let isPresentingInAddMealMode = presentingViewController is UINavigationController;
        if (isPresentingInAddMealMode)
        {
            dismissViewControllerAnimated(true, completion: nil)
        }
        else {
            navigationController!.popViewControllerAnimated(true);
        }
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (sender === saveButton)
        {
            let name = nameTextField.text ?? "";
            let photo  = photoImageView.image;
            let rating = ratingControl.rating;
            meal = Meal(name: name, photo: photo, rating: rating);
        }
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





