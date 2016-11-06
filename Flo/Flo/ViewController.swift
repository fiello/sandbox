//
//  ViewController.swift
//  Flo
//
//  Created by Gaara on 25/07/16.
//  Copyright © 2016 Gaara. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var counterView: CounterView!
    @IBOutlet weak var graphView: GraphView!
    @IBOutlet weak var counterLabel: UILabel!
    var isGraphViewShowing = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if let loadedCounter = loadCounters() {
            counterView.counter = loadedCounter
        }
        else {
            counterView.counter = Counter(counter: 0)
        }
        counterView.counter!.parentView = counterView
        updateCounterLabel()
        counterView.layer.zPosition = 1 // force counter on top
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnPushButton(button: PushButtonView)
    {
        if button.isAddButton
        {
            if MaxNumberOfGlasses > counterView.counter!.numOfGlasses {
                counterView.counter!.numOfGlasses += 1
            }
        }
        else
        {
            if counterView.counter!.numOfGlasses > 0 {
                counterView.counter!.numOfGlasses -= 1;
            }
        }
        
        if isGraphViewShowing {
            counterViewTap(gesture: nil)
        }
        
        unloadCounters()
        updateCounterLabel()
    }
    
    @IBAction func counterViewTap(gesture: UITapGestureRecognizer?)
    {
        if isGraphViewShowing
        {
            UIView.transition(from: graphView, to: counterView, duration: 1.0, options:
                [UIViewAnimationOptions.transitionFlipFromRight, UIViewAnimationOptions.showHideTransitionViews], completion: nil)
        }
        else {
            UIView.transition(from: counterView, to: graphView, duration: 1.0, options:
                [UIViewAnimationOptions.transitionFlipFromLeft, UIViewAnimationOptions.showHideTransitionViews], completion: nil)
            
        }
        isGraphViewShowing = !isGraphViewShowing
    }
    
    func updateCounterLabel()
    {
        counterLabel.text = String(counterView.counter!.numOfGlasses)
    }
    
    func loadCounters() -> Counter?
    {
        return NSKeyedUnarchiver.unarchiveObject(withFile: Counter.ArchiveUrl.path) as? Counter
    }
    
    func unloadCounters()
    {
        NSKeyedArchiver.archiveRootObject(counterView.counter!, toFile: Counter.ArchiveUrl.path)
    }
    
}

