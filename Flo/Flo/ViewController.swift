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
            if NumberOfGlasses > counterView.counter {
                counterView.counter += 1
            }
        }
        else
        {
            if counterView.counter > 0 {
                counterView.counter -= 1;
            }
        }
        
        updateCounterLabel()
    }
    
    func updateCounterLabel()
    {
        counterLabel.text = String(counterView.counter)
    }
    
}

