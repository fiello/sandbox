//
//  GraphView.swift
//  Flo
//
//  Created by Gaara on 06/11/16.
//  Copyright © 2016 Gaara. All rights reserved.
//

import UIKit

@IBDesignable
class GraphView: UIView {

    @IBInspectable var startColor : UIColor = UIColor.red
    @IBInspectable var endColor: UIColor  = UIColor.green
    

    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation. */
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        let context = UIGraphicsGetCurrentContext()
        let colors = [startColor.cgColor, endColor.cgColor] as CFArray
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        
        let colorLocations : [CGFloat] = [0.0, 1.0]
        let gradient = CGGradient.init(colorsSpace: colorSpace, colors: colors, locations: colorLocations)
        
        let startPoint = CGPoint.zero
        let endPoint = CGPoint(x:0, y:self.bounds.height)
        context!.drawLinearGradient(gradient!,
                start: startPoint,
                end: endPoint,
                options: [])
    }
 

}
