//
//  PushButtonView.swift
//  Flo
//
//  Created by Gaara on 25/07/16.
//  Copyright © 2016 Gaara. All rights reserved.
//

import UIKit

@IBDesignable
class PushButtonView: UIButton {

    override func drawRect(rect: CGRect) {
        var path = UIBezierPath(ovalInRect: rect)
        UIColor.blueColor().setFill()
        path.fill();
    }
    
}
