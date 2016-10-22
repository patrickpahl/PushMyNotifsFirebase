//
//  AppDelegate.swift
//  PushMyNotifs
//
//  Created by Patrick Pahl on 10/19/16.
//  Copyright © 2016 Patrick Pahl. All rights reserved.

///For push notifcations:
//developer.apple.com -> account -> certificates
//Create app id: Click App Id (left)
//copy bundle identifier
//Enter name: i.e. 'PushMyNotifs', and paste bundleID
//***Click Push Notifications
//Continue/Register/Done
//development (left side), click + (top right)
//Apple push notification service SSL
//select project i.e. PushMyNotifs
//Create CSR file: Go to keychain access app
//KeyChain Access -> Certificate Assistant -> Req Cert from a Cert Authority
//Enter email/name AND Save to Disk AND specify key pair information
//Continue/then quit keychain
//back to apple.developer.com -> Pick the file you put on your desktop
//Then download it, click it to install it in keychain access
//Click OK to add it
//go to FIREBASE, click gear by top-left of project, project settings
//Click Cloud Messaging
//Under development, unpload certificate (Not the one you just DL'ed, p12 file)
//Go to Keychain, find file i.e. PushMyNotifs (On left: login top, certs below)
//expand, right-click the key, export.
//Save as certificates, p12 file.
//Create password for the file
//Back to Firebase, upload cert to development
//browse for p12 file and enter password
//in app, register for push notifications and set entitlements
//Xcode: top left project file, capabilites, click push notifications, turn ON
//
//Added pod file: Firebase/Messaging, in addition to Firebase

//*To actually send a push notification- run app on your device, go to home screen on phone, then go to Firebase -> Messaging -> New Message -> Enter message, target user by selecting app, send now.

import UIKit
import Firebase
import FirebaseInstanceID
import FirebaseMessaging
///Added!

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        if #available(iOS 8.0, *) {
            let settings: UIUserNotificationSettings = UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
            application.registerUserNotificationSettings(settings)
            application.registerForRemoteNotifications()
            //This will register your app for push notifications, otherwise your app won't show them.
        } else {
            //New for iOS 10
            let types: UIRemoteNotificationType = [.alert, .badge, .sound]
            application.registerForRemoteNotifications(matching: types)
        }
        
        FIRApp.configure()
        NotificationCenter.default.addObserver(self, selector: #selector(self.tokenRefreshNotification(notification:)), name: NSNotification.Name.firInstanceIDTokenRefresh, object: nil)
        //Adding ourself as an observer for firebaseIDTokenRefresh
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
       
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
            FIRMessaging.messaging().disconnect()
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
       
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
     connectToFirebaseMessaging()
        //Connect once you fire the app up.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        
    }

    //Added
    func connectToFirebaseMessaging() {
        FIRMessaging.messaging().connect { (error) in
            if error != nil {
                print("FB messaging error")
            } else {
                print("Connected to firebase messaging manager")
            }
        }
    }
    //Added
    func tokenRefreshNotification(notification: NSNotification) {
        
        let refreshedToken = FIRInstanceID.instanceID().token()
        print("InstanceID token: \(refreshedToken)")
        // Your app has to refresh the token everynow and then from the firebase database- Here we're just showing when we get a new token.
        connectToFirebaseMessaging()
        // Whenever you have a new token, connect to firebase messaging.
    }

}

