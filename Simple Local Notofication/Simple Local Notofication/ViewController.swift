//
//  ViewController.swift
//  Simple Local Notofication
//
//  Created by RAMDHAN CHOUDHARY on 16/05/19.
//  Copyright © 2019 RDC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    var appDelegate = UIApplication.shared.delegate as? AppDelegate
    let notifications = ["Simple Local Notification",
                         "Local Notification with Action",
                         "Local Notification with Content",]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return notifications.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = notifications[indexPath.row]
        return cell
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let notificationType = notifications[indexPath.row]
        let alert = UIAlertController(title: "",
                                      message: "After 5 seconds " + notificationType + " will appear",
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Okay, I will wait", style: .default) { (action) in
            self.appDelegate?.scheduleNotification(notificationType: notificationType)
        }
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}

