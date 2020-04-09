//
//  AppDelegate.swift
//  my-commerce
//
//  Created by Imanuel Pardosi on 06/04/20.
//  Copyright © 2020 Imanuel Pardosi. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn
import FBSDKLoginKit

@UIApplicationMain class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Use Firebase library to configure APIs
        FirebaseApp.configure()
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        
        return true
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        
        // Logout both Goole and Facebook account
        
        GIDSignIn.sharedInstance()?.signOut()
        
        let loginManager = LoginManager()
        loginManager.logOut()
    }

    // MARK: UISceneSession Lifecycle
    
//    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
//        let handledFB = FBSDKCoreKit.ApplicationDelegate.shared.application(app, open: url, options: options)
//        let handledGoogle = GIDSignIn.sharedInstance().handle(url, sourceApplication: <#String?#>)
//        return handledFB || handledGoogle
//    }
//
//    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject) -> Bool {
//
//    }
//
//    open func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
//
//    }
    
//    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
//        let handledFB = FBSDKCoreKit.ApplicationDelegate.shared.application(app, open: url, options: options)
//        let handledGoogle = GIDSignIn.sharedInstance().handle(url, sourceApplication: nil, annotation: nil)
//
//        return handledFB || handledGoogle
//    }
    
     //MARK: - Handle URL for FB and Google Sign -
    func application(_ application: UIApplication, open url: URL, sourceApplication: String?, annotation: Any) -> Bool {

        //handle the URL that your application receives at the end of the authentication process -
        
        // handle Facebook url scheme
        let wasHandled: Bool = ApplicationDelegate.shared.application(application, open: url, sourceApplication: sourceApplication, annotation: annotation)
        // handle Google url scheme
        let googlePlusFlag: Bool = GIDSignIn.sharedInstance().handle(url, sourceApplication: sourceApplication!, annotation: annotation)
        
        return wasHandled || googlePlusFlag
    }

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
}

