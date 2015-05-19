//
//  NotificationController.swift
//  pushtest WatchKit Extension
//
//  Created by Filip Fafara on 5/19/15.
//  Copyright (c) 2015 Thoughtworks. All rights reserved.
//

import WatchKit
import Foundation


class NotificationController: WKUserNotificationInterfaceController {

    @IBOutlet var alertLabel: WKInterfaceLabel? = WKInterfaceLabel()
    @IBOutlet var bodyLabel: WKInterfaceLabel? = WKInterfaceLabel()
    @IBOutlet var gmtLabel: WKInterfaceLabel? = WKInterfaceLabel()
    @IBOutlet var mstLabel: WKInterfaceLabel? = WKInterfaceLabel()
    @IBOutlet var cstLabel: WKInterfaceLabel? = WKInterfaceLabel()
    @IBOutlet var estLabel: WKInterfaceLabel? = WKInterfaceLabel()
    
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

    /*
    override func didReceiveLocalNotification(localNotification: UILocalNotification, withCompletion completionHandler: ((WKUserNotificationInterfaceType) -> Void)) {
        // This method is called when a local notification needs to be presented.
        // Implement it if you use a dynamic notification interface.
        // Populate your dynamic notification interface as quickly as possible.
        //
        // After populating your dynamic notification interface call the completion block.
        completionHandler(.Custom)
    }
    */
    
    
    override func didReceiveRemoteNotification(remoteNotification: [NSObject : AnyObject], withCompletion completionHandler: ((WKUserNotificationInterfaceType) -> Void)) {
        // This method is called when a remote notification needs to be presented.
        // Implement it if you use a dynamic notification interface.
        // Populate your dynamic notification interface as quickly as possible.
        //
        // After populating your dynamic notification interface call the completion block.
        self.updateClocks()
        
        if let remoteaps:NSDictionary = remoteNotification["aps"] as? NSDictionary{
            if let remoteAlert:NSDictionary = remoteaps["alert"] as? NSDictionary{
                handleNotification( remoteAlert );
            }
        }
        
        completionHandler(.Custom)
    }
    
    func handleNotification( alert : AnyObject? ){
        
        if let alert: AnyObject = alert, let remotetitle = alert["title"] as? String{
            println( "didReceiveRemoteNotification::remoteNotification.alert \(remotetitle)" )
            self.alertLabel!.setText(remotetitle);
        }
        if let alert: AnyObject = alert, let remotebody = alert["body"] as? String{
            //println( "didReceiveRemoteNotification::remoteNotification.alert \(remotetitle)" )
            self.bodyLabel!.setText(remotebody);
        }
    }

    func updateClocks(){
        var time: NSDate = NSDate()
        
        let formatter:NSDateFormatter = NSDateFormatter();
        var timeZone = NSTimeZone(name: "UTC")
        formatter.timeZone = timeZone
        formatter.dateFormat = "h:mm a"
        var formattedString = formatter.stringFromDate(time)
        var formatDateString = formattedString.stringByReplacingOccurrencesOfString(" p", withString: "PM", options: nil, range: nil)
        formattedString = formattedString.stringByReplacingOccurrencesOfString(" a", withString: "AM", options: nil, range: nil)
        
        timeZone = NSTimeZone(name: "US/Eastern")
        formatter.timeZone = timeZone
        formatter.dateFormat = "h:mm a"
        formattedString = formatter.stringFromDate(time)
        formatDateString = formattedString.stringByReplacingOccurrencesOfString(" p", withString: "PM", options: nil, range: nil)
        formattedString = formattedString.stringByReplacingOccurrencesOfString(" a", withString: "AM", options: nil, range: nil)
        self.estLabel?.setText(formatDateString)
        
        timeZone = NSTimeZone(forSecondsFromGMT: 0)
        formatter.timeZone = timeZone
        formatter.dateFormat = "h:mm a"
        formattedString = formatter.stringFromDate(time)
        formatDateString = formattedString.stringByReplacingOccurrencesOfString(" p", withString: "PM", options: nil, range: nil)
        formattedString = formattedString.stringByReplacingOccurrencesOfString(" a", withString: "AM", options: nil, range: nil)
        self.gmtLabel?.setText(formatDateString)
        
        timeZone = NSTimeZone(name: "US/Mountain")
        formatter.timeZone = timeZone
        formatter.dateFormat = "h:mm a"
        formattedString = formatter.stringFromDate(time)
        formatDateString = formattedString.stringByReplacingOccurrencesOfString(" p", withString: "PM", options: nil, range: nil)
        formattedString = formattedString.stringByReplacingOccurrencesOfString(" a", withString: "AM", options: nil, range: nil)
        self.mstLabel?.setText(formatDateString)
        
        timeZone = NSTimeZone(name: "US/Central")
        formatter.timeZone = timeZone
        formatter.dateFormat = "h:mm a"
        formattedString = formatter.stringFromDate(time)
        formatDateString = formattedString.stringByReplacingOccurrencesOfString(" p", withString: "PM", options: nil, range: nil)
        formattedString = formattedString.stringByReplacingOccurrencesOfString(" a", withString: "AM", options: nil, range: nil)
        self.cstLabel?.setText(formatDateString)
        
    }
    
}
