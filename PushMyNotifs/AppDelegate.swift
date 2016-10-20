//
//  AppDelegate.swift
//  PushMyNotifs
//
//  Created by Patrick Pahl on 10/19/16.
//  Copyright © 2016 Patrick Pahl. All rights reserved.

///For push notifcations: developer.apple.com
//account -> certificates
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



import UIKit
import Firebase
///Added!

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        FIRApp.configure()
        ///ADDED!
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

