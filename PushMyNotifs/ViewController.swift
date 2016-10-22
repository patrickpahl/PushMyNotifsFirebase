//
//  ViewController.swift
//  PushMyNotifs
//
//  Created by Patrick Pahl on 10/19/16.
//  Copyright © 2016 Patrick Pahl. All rights reserved.
//

import UIKit
import Firebase
import FirebaseInstanceID
import FirebaseMessaging

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        FIRMessaging.messaging().subscribe(toTopic: "/topics/news")
        //example
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

