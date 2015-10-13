//
//  ViewController.swift
//  Alerter
//
//  Created by rob on 7/13/15.
//  Copyright © 2015 the Klebeian Group. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    static let app = UIApplication.sharedApplication()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("phone view controller loaded")

        /*let localNotification:UILocalNotification = UILocalNotification()
        
        localNotification.alertAction = "Testing inline reply notificaions on iOS9"
        
        localNotification.alertBody = "Woww it works!!"
        
        localNotification.fireDate = NSDate(timeIntervalSinceNow: 5)
        
        localNotification.category = "INVITE_CATEGORY";
        
        UIApplication.sharedApplication().scheduleLocalNotification(localNotification)
        print("5 sec notification sent")
        UIApplication.sharedApplication().presentLocalNotificationNow(localNotification)
        print("now notification sent") */
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

