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
    @IBOutlet weak var romajiLbl: WKInterfaceLabel!
    @IBOutlet weak var questionLabel: WKInterfaceLabel!
    @IBOutlet weak var questionImg: WKInterfaceImage!
    @IBOutlet weak var option1: WKInterfaceButton!
    @IBOutlet weak var option2: WKInterfaceButton!

    var plistPath: String?
    var counter : Int?
    var rightOption : UInt8?
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        self.questionImg.setImageNamed("boy head.png");
        self.plistPath = NSBundle.mainBundle().pathForResource("WatchDictionary", ofType: "plist")
        self.counter = 0;
        loadQuestion(counter!);
        

    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func buttonAClicked() {
        self.checkAnswer(0);
    }
    @IBAction func buttonBCliked() {
        self.checkAnswer(1);
    }
    
    func loadQuestion(question : Int){
        var questionNumber = 0;
        if(question > 9){
            self.counter = 0;
            questionNumber = 0;
        }else{
            questionNumber = question;
        }
        if let dic = NSDictionary(contentsOfFile: plistPath!){
            var data : NSArray = (dic.objectForKey("Questions") as? NSArray)!;
            romajiLbl.setText(data[questionNumber][1] as? String);
            questionLabel.setText(data[questionNumber][5] as? String);
//          questionImg.setImageNamed(data[questionNumber][2] as? String);
            if(Int(arc4random_uniform(11)) > 5){
                option1.setTitle(data[questionNumber][3] as? String);
                option2.setTitle(data[questionNumber][4] as? String);
                rightOption = 0;
            }else{
                option1.setTitle(data[questionNumber][4] as? String);
                option2.setTitle(data[questionNumber][3] as? String);
                rightOption = 1;
            }
            self.updateUserActivity("com.nekosenseicorporation.Gengo.WatchApp", userInfo: ["question": (data[questionNumber][5] as? String)!, "romaji": (data[questionNumber][1] as? String)!, "imageName" : (data[questionNumber][2] as? String)!, "rightOption" : (data[questionNumber][3] as? String)!,"wrongOption" : (data[questionNumber][4] as? String)!], webpageURL: nil)
        }
    }
    
    func checkAnswer(option : UInt8){
        if(option == rightOption){
            counter = counter!+1
            loadQuestion(counter!);
        }else{
            println("Erroooo feio, errou rude :P")
        }
    }
    
    
    
    
    //parte da notification:
    
    
    override func handleActionWithIdentifier(identifier: String?, forLocalNotification localNotification: UILocalNotification) {
        var rightAnswer = localNotification.userInfo!["rightAnswer"] as! Int
        if((identifier == "A" && rightAnswer == 0) || (identifier == "B" && rightAnswer == 1)) {
            println("repsosta certa")
        } else {
            println("repsosta errada")
        }
        
    }
}
