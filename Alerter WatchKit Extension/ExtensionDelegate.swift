//
//  ExtensionDelegate.swift
//  Alerter WatchKit Extension
//
//  Created by rob on 7/13/15.
//  Copyright © 2015 the Klebeian Group. All rights reserved.
//

import WatchKit
import WatchConnectivity
import UIKit
import Foundation

class ExtensionDelegate: NSObject, WKExtensionDelegate, WCSessionDelegate {
    
    
    func applicationDidFinishLaunching() {

        if WCSession.isSupported() {  //start isSupported
            let session = WCSession.defaultSession()
            session.delegate = self
            session.activateSession()
        }  //end if WCSession.isSupported
    }

    func applicationDidBecomeActive() {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillResignActive() {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, etc.
    }

}
