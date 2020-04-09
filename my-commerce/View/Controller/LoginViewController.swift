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

class LoginViewController: UIViewController {

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
        self.signInWithFacebook()
    }
    
    private func signInWithFacebook() {
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
            
            self.goToTabBar()
        }
    }
    
    private func goToTabBar() {
        let nextVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "tabBarViewController") as! TabBarViewController
        self.present(nextVC, animated: false, completion: nil)
    }
}

extension LoginViewController: GIDSignInUIDelegate, GIDSignInDelegate{
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            print(error)
            return
        }
        
        self.goToTabBar()
    }
}
