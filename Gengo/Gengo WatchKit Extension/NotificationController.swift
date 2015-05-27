//
//  NotificationController.swift
//  Gengo WatchKit Extension
//
//  Created by Hariel Giacomuzzi on 5/21/15.
//  Copyright (c) 2015 Daniel Amarante. All rights reserved.
//

import WatchKit
import Foundation


class NotificationController: WKUserNotificationInterfaceController {

    @IBOutlet weak var image: WKInterfaceImage!
    @IBOutlet weak var question: WKInterfaceLabel!
    @IBOutlet weak var optionA: WKInterfaceLabel!
    @IBOutlet weak var optionB: WKInterfaceLabel!
    
    override init() {
        // Initialize variables here.
        super.init()
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }


    override func didReceiveLocalNotification(localNotification: UILocalNotification, withCompletion completionHandler: ((WKUserNotificationInterfaceType) -> Void)) {
        var optionA = localNotification.userInfo!["optionA"] as! String
        var optionB = localNotification.userInfo!["optionB"] as! String
        var question = localNotification.userInfo!["question"] as! String
        //var image = localNotification.userInfo!["image"] as! String
        
        self.question.setText(question)
        self.optionA.setText(optionA)
        self.optionB.setText(optionB)
        //self.image.setImageNamed(image)
        
        
        completionHandler(.Custom)
    }

    

//    override func didReceiveRemoteNotification(remoteNotification: [NSObject : AnyObject], withCompletion completionHandler: ((WKUserNotificationInterfaceType) -> Void)) {
//        // This method is called when a remote notification needs to be presented.
//        // Implement it if you use a dynamic notification interface.
//        // Populate your dynamic notification interface as quickly as possible.
//        //
//        // After populating your dynamic notification interface call the completion block.
//        completionHandler(.Custom)
//    }

}
