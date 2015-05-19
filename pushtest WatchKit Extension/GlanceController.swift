//
//  GlanceController.swift
//  pushtest WatchKit Extension
//
//  Created by Filip Fafara on 5/19/15.
//  Copyright (c) 2015 Thoughtworks. All rights reserved.
//

import WatchKit
import Foundation


class GlanceController: WKInterfaceController {
    
    @IBOutlet var estLabel: WKInterfaceLabel? = WKInterfaceLabel()
    @IBOutlet var cstLabel: WKInterfaceLabel? = WKInterfaceLabel()
    @IBOutlet var mstLabel: WKInterfaceLabel? = WKInterfaceLabel()
    @IBOutlet var gmtLabel: WKInterfaceLabel? = WKInterfaceLabel()

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        var timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: Selector("updateClocks"), userInfo: nil, repeats: true)
        timer.fire()
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func updateClocks() {
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
        
        timeZone = NSTimeZone(name: "UTC")
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
