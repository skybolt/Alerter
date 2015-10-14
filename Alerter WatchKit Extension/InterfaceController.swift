//
//  InterfaceController.swift
//  Alerter WatchKit Extension
//
//  Created by rob on 7/13/15.
//  Copyright © 2015 the Klebeian Group. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity
import UIKit


class InterfaceController: WKInterfaceController, WCSessionDelegate {
    
    var session = WCSession.defaultSession()

    @IBOutlet var interfaceLabel: WKInterfaceLabel!
    
    func showReachable() {
        
        print("WkX sessionState is\(session.reachable)")
        let sessionState = session.reachable
        if sessionState == true {
            interfaceLabel.setText("Conntected\nto iPhone")
        }
        else if sessionState == false {
            interfaceLabel.setText("iPhone\ndisconnected!")
        }
    }
    
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        
        session.delegate = self
        session.activateSession()
        
        showReachable()
        
        //interfaceLabel.setText("Session Reachability is \(session.reachable)")
    }
    
    func sessionWatchStateDidChange(session: WCSession) {
        print("sessionWatchStateDidChange")
        showReachable()
    }
    
    func sessionReachabilityDidChange(session: WCSession) {
        print("sessionWatchStateDidChange")
        showReachable()
    }
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
