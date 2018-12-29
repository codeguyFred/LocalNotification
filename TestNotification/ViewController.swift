//
//  ViewController.swift
//  TestNotification
//
//  Created by Fred on 2018/12/29.
//  Copyright © 2018 Fred. All rights reserved.
//

import UIKit
import UserNotifications
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert]) { (success, error) in
            if success {
                print("success")
            } else {
                print("error")
            }
        }
    }


    @IBAction func notify(_ sender: Any) {
        // 1
        let content = UNMutableNotificationContent()
        content.title = "今天的事情"
        content.subtitle = "重要"
        content.body = "重要的事情"
        
        
        // 2
        //        let imageName = "applelogo"
        //        guard let imageURL = Bundle.main.url(forResource: imageName, withExtension: "png") else { return }
        //
        //        let attachment = try! UNNotificationAttachment(identifier: imageName, url: imageURL, options: .none)
        //
        //        content.attachments = [attachment]
        
        // 3
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 10, repeats: false)
        let request = UNNotificationRequest(identifier: "notification.id.01", content: content, trigger: trigger)
        
        // 4
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)

    }
    
}

