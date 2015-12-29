//
//  RatingControl.swift
//  FoodTracker
//
//  Created by dmisin on 12/29/15.
//  Copyright © 2015 GZS. All rights reserved.
//

import UIKit

class RatingControl: UIView
{
    // MARK: Properties
    var rating = 0
    {
        didSet {
            setNeedsLayout();
        }
    }
    var spacing = 5;
    var stars = 5;
    var ratingButtons = [UIButton]();
    var buttonsAdjusted: Bool = false;
    
    // MARK: Initialization
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        let filledStarImage = UIImage(named: "filledStar");
        let emptyStarImage = UIImage(named: "emptyStar");
        for _ in 0..<stars
        {
            let button = UIButton();
            button.addTarget(self, action: "ratingButtonTapped:", forControlEvents: .TouchDown);
            button.setImage(filledStarImage, forState: [.Highlighted, .Selected]);
            button.setImage(filledStarImage, forState: .Selected);
            button.setImage(emptyStarImage, forState: .Normal);
            button.adjustsImageWhenHighlighted = false;
            ratingButtons += [button];
            addSubview(button);
        }
    }
    
    override func layoutSubviews()
    {
        if (ratingButtons.isEmpty || buttonsAdjusted)
        {
            return;
        }

        buttonsAdjusted = ratingButtons.count == stars ? true : false;
        let buttonSize = Int(frame.size.height);
        var buttonFrame = CGRect(x:0, y:0, width:buttonSize, height: buttonSize);

        for (index, button) in ratingButtons.enumerate()
        {
            buttonFrame.origin.x = 	CGFloat(index * (buttonSize + spacing));
            button.frame = buttonFrame;
        }
        updateButtonSelectionStates();
    }
    
    override func intrinsicContentSize() -> CGSize
    {
        return CGSize(width: 240, height: 44);
    }
    
    // MARK: Button action
    func ratingButtonTapped(button: UIButton)
    {
        let oldRating = rating;
        rating = ratingButtons.indexOf(button)! + 1;
        if (rating == oldRating && oldRating == 1)
        {
            rating = 0; // correction to deselect if we tap on zero button
        }
        updateButtonSelectionStates();
    }
    
    func updateButtonSelectionStates()
    {
        for (index, button) in ratingButtons.enumerate()
        {
            button.selected = index < rating;
        }
    }

}
