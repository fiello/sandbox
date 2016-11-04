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
    @IBOutlet weak var counterLabel: UILabel!

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
        unloadCounters()
        updateCounterLabel()
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

