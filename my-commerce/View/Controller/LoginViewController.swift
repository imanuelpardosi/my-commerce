//
//  LoginViewController.swift
//  my-commerce
//
//  Created by Imanuel Pardosi on 07/04/20.
//  Copyright © 2020 Imanuel Pardosi. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn
import FBSDKLoginKit

class LoginViewController: UIViewController, GIDSignInUIDelegate, GIDSignInDelegate {
    
    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardTappedAround()
        
        GIDSignIn.sharedInstance()?.uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
        
    }
    
    @IBAction func btnSignInGoogleOnClick() {
        GIDSignIn.sharedInstance().signIn()
        
    }
    
    @IBAction func btnSignInFacebookOnClick() {
        let loginManager = LoginManager()
        loginManager.logIn(permissions: [], from: self) { (result, error) in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
            
            guard let result = result, !result.isCancelled else {
                print("User cancelled login")
                return
            }
            
            let nextVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "tabBarViewController") as! TabBarViewController
            self.present(nextVC, animated: false, completion: nil)
        }
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            print(error)
            return
        }

        guard let authentication = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                        accessToken: authentication.accessToken)
        print(credential)
        print(user.profile.email ?? "no email")
        
        let nextVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "tabBarViewController") as! TabBarViewController
        self.present(nextVC, animated: false, completion: nil)
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        // Perform any operations when the user disconnects from app here.
        // ...
    }
}
