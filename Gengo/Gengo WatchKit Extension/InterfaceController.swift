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
        

    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    override func handleActionWithIdentifier(identifier: String?, forLocalNotification localNotification: UILocalNotification) {
        var rightAnswer = localNotification.userInfo!["rightAnswer"] as! Int
        if((identifier == "A" && rightAnswer == 0) || (identifier == "B" && rightAnswer == 1)) {
            println("repsosta certa")
        } else {
            println("repsosta errada")
        }
        
    }
    
    override func handleActionWithIdentifier(identifier: String?, forRemoteNotification remoteNotification: [NSObject : AnyObject]) {
        println(identifier)
    }
    

}
