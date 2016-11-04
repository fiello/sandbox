//
//  Counter.swift
//  Flo
//
//  Created by Gaara on 04/11/16.
//  Copyright © 2016 Gaara. All rights reserved.
//

import UIKit
let MaxNumberOfGlasses = 8

class Counter : NSObject, NSCoding {
    
    var numOfGlasses: Int {
        didSet {
            if numOfGlasses <= MaxNumberOfGlasses,
            let parent = parentView {
                parent.setNeedsDisplay()
            }
        }
    }
    var parentView : UIView?
        
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveUrl = DocumentsDirectory.appendingPathComponent("counter")
    
    struct PropertyKey {
        static let nameCounter = "numOfGlasses"
    }
    
    init?(counter: Int)
    {
        self.numOfGlasses = counter
        super.init()
    }

    // MARK: NSCoding
    func encode(with aCoder: NSCoder)
    {
        aCoder.encode(numOfGlasses, forKey: PropertyKey.nameCounter)
    }
    
    required convenience init?(coder aDecoder: NSCoder)
    {
        let count = aDecoder.decodeInteger(forKey: PropertyKey.nameCounter)
        self.init(counter: count)
    }
}

