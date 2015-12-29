//
//  Meal.swift
//  FoodTracker
//
//  Created by Dmitry Sinelnikov on 29/12/2015.
//  Copyright © 2015 GZS. All rights reserved.
//

import UIKit

class Meal
{
    // MARK: Properties
    
    var name: String;
    var photo: UIImage?
    var rating: Int;
    
    // MARK: Initialization
    init? (name: String, photo: UIImage?, rating: Int)
    {
        self.name = name;
        self.photo = photo;
        self.rating = rating;
        
        if (name.isEmpty || rating < 0)
        {
            return nil;
        }
    }
    
};
