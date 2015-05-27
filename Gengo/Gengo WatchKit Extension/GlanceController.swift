//
//  GlanceController.swift
//  Gengo WatchKit Extension
//
//  Created by Hariel Giacomuzzi on 5/21/15.
//  Copyright (c) 2015 Daniel Amarante. All rights reserved.
//

import WatchKit
import Foundation


class GlanceController: WKInterfaceController {
    
    @IBOutlet weak var imgGlance: WKInterfaceGroup!

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        //self.imgGlance.setBackgroundImage(UIImage(named: "icon.png"))
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
