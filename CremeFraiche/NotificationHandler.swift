//
//  NotificationHandler.swift
//  CremeFraiche
//
//  Created by Yanis OUALAN on 10/01/2022.
//

import Foundation
import SwiftUI

func askNotification(){
    let center = UNUserNotificationCenter.current()
    center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
        
        if let error = error {
            // Handle the error here.
        }
        
        // Enable or disable features based on the authorization.
    }
}
func sendNotification(title: String, content: String, badge: NSNumber = 1){
    let userNotificationCenter = UNUserNotificationCenter.current()
    let notificationContent = UNMutableNotificationContent()
    notificationContent.title = title
    notificationContent.body = content
    notificationContent.badge = badge
    
    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
    let request = UNNotificationRequest(identifier: "creamMachine", content: notificationContent, trigger: trigger)
    userNotificationCenter.add(request) { (error) in
        if let error = error {
            print("Notification Error: ", error)
        }
    }
    
}
func getHour() -> Int{
    let date = Date()
    let calendar = Calendar.current
    let hour = calendar.component(.hour, from: date)
    return hour
}
func getSalutation() -> String{
    var salutation: String = "Bonjour"
    if(getHour() >= 18 || getHour() <= 4){
        salutation = "Bonsoir"
    }
    return salutation
}
