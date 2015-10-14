//
//  AppDelegate.swift
//  Alerter
//
//  Created by rob on 7/13/15.
//  Copyright © 2015 the Klebeian Group. All rights reserved.
//

import UIKit
import WatchConnectivity
import Foundation


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, WCSessionDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        if WCSession.isSupported() {  //start isSupported
            let session = WCSession.defaultSession()
            session.delegate = self
            session.activateSession()
            print ("From Phone AppDel reachable \(session.reachable)")
            
        }  //end if WCSession.isSupported
        
        //creating the inline reply notification action
        let replyAction = UIMutableUserNotificationAction()
        replyAction.title = "Say Something"
        replyAction.identifier = "inline-reply"
        replyAction.activationMode = .Background
        replyAction.authenticationRequired = false
        replyAction.behavior = .TextInput 
        
        //creating a category
        let notificationCategory:UIMutableUserNotificationCategory = UIMutableUserNotificationCategory()
        notificationCategory.identifier = "INVITE_CATEGORY"
        notificationCategory .setActions([replyAction], forContext: UIUserNotificationActionContext.Default)

        //registerting for the notification.
        application.registerUserNotificationSettings(UIUserNotificationSettings(forTypes:[ UIUserNotificationType.Sound, UIUserNotificationType.Alert,
            UIUserNotificationType.Badge], categories: NSSet(array:[notificationCategory]) as? Set<UIUserNotificationCategory>))
    
        // Override point for customization after application launch.
        self.beginBackgroundUpdateTask()

        return true
    }
    
    func beginBackgroundUpdateTask() -> UIBackgroundTaskIdentifier {
        return UIApplication.sharedApplication().beginBackgroundTaskWithExpirationHandler({})
    }
    
    func endBackgroundUpdateTask(taskID: UIBackgroundTaskIdentifier) {
        UIApplication.sharedApplication().endBackgroundTask(taskID)
    }

    
    func sessionWatchStateDidChange(session: WCSession) {
        print("p: sessionWatchStateDidChange")
        //presentLocalNotificationNow
        
        let connectionNotification = UILocalNotification.init()
        
        connectionNotification.alertBody = "p: sessionWatchStateDidChange()\nsession = \(session.reachable)"
        UIApplication.sharedApplication().presentLocalNotificationNow(connectionNotification)
        
    }
    func sessionReachabilityDidChange(session: WCSession) {
        
        print("p: sessionReachabilityDidChange")
        let connectionNotification = UILocalNotification.init()
        
        if session.reachable == true {
            connectionNotification.alertBody = "Connected to watch (session.reachable == \(session.reachable))"        }
        if session.reachable == false {
            connectionNotification.alertBody = "Watch disconnected (session.reachable == \(session.reachable))"
        }
        UIApplication.sharedApplication().presentLocalNotificationNow(connectionNotification)
    }

    
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

}

