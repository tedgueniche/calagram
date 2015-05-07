//
//  LoginViewController.swift
//  calagram
//
//  Created by jonathan caouette on 2015-05-04.
//  Copyright (c) 2015 jonathan caouette. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController, FBLoginViewDelegate {

    @IBOutlet weak var facebookLoginView: FBLoginView!
    @IBOutlet weak var tempImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //Setup the FacebookLoginView
        self.facebookLoginView.delegate = self
        self.facebookLoginView.readPermissions = ["public_profile", "publish_actions", "user_friends", "user_birthday"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func LoginButtonTouched(sender: AnyObject) {
        self.performSegueWithIdentifier("LoginToHomeSegue", sender: "self")
    }

    //FacebookLoginViewDelegate
    func loginViewShowingLoggedInUser(loginView: FBLoginView!) {
//        tempImageView.hidden = false
    }
    
    func loginViewFetchedUserInfo(loginView: FBLoginView!, user: FBGraphUser!) {
        
        //println(user)
        
        self.performSegueWithIdentifier("LoginToHomeSegue", sender: "self")
        
        //Get Profile Image
//        let userImageURL = "https://graph.facebook.com/\(user.objectID)/picture?type=large"
//        let url = NSURL(string: userImageURL)
//        let imageData = NSData(contentsOfURL: url!)
//        let image = UIImage(data: imageData!)
//        tempImageView.image = image
    }
    
    func loginViewShowingLoggedOutUser(loginView: FBLoginView!) {
//        tempImageView.hidden = true
    }
    
    func loginView(loginView: FBLoginView!, handleError error: NSError!) {
        println("Error: \(error.localizedDescription)")
    }
    
}
