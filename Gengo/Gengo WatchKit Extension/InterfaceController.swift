//
//  InterfaceController.swift
//  Gengo WatchKit Extension
//
//  Created by Hariel Giacomuzzi on 5/21/15.
//  Copyright (c) 2015 Daniel Amarante. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    @IBOutlet weak var questionLabel: WKInterfaceLabel!
    
    @IBOutlet weak var option1: WKInterfaceButton!
    @IBOutlet weak var option2: WKInterfaceButton!

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        let plistPath = NSBundle.mainBundle().pathForResource("WatchDictionary", ofType: "plist")
        if let dict = NSDictionary(contentsOfFile: plistPath!) {
            var keys = dict.allKeys
            var question = keys[0] as! String
            var answer = dict[question] as! String
            questionLabel.setText(question)
            option1.setTitle(answer)
            option2.setTitle("errada")
        }

    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func activateNotificationsButtonClicked() {
        println("oie")
    }
    
    

}
