//
//  Meal.swift
//  FoodTracker
//
//  Created by Dmitry Sinelnikov on 29/12/2015.
//  Copyright © 2015 GZS. All rights reserved.
//

import UIKit

class Meal: NSObject, NSCoding
{
    // MARK: Properties
    var name: String;
    var photo: UIImage?
    var rating: Int;
    
    // MARK: Archiving paths
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveUrl = DocumentsDirectory.appendingPathComponent("meals");
    
    // MARK: Types
    struct PropertyKey {
        static let nameKey = "name"
        static let photoKey = "photo"
        static let ratingKey = "rating"
    }
    
    // MARK: Initialization
    init? (name: String, photo: UIImage?, rating: Int)
    {
        self.name = name;
        self.photo = photo;
        self.rating = rating;
        
        super.init();
        
        if (name.isEmpty || rating < 0)
        {
            return nil;
        }
    }
    
    // MARK: NSCoding
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.nameKey)
        aCoder.encode(photo, forKey: PropertyKey.photoKey)
        aCoder.encode(rating, forKey: PropertyKey.ratingKey)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObject(forKey: PropertyKey.nameKey) as! String;
        let photo = aDecoder.decodeObject(forKey: PropertyKey.photoKey) as? UIImage;
        let rating = aDecoder.decodeInteger(forKey: PropertyKey.ratingKey);
        
        self.init(name: name, photo: photo, rating: rating);
    }

};
