//
//  LoginViewController.swift
//  SmartMenu
//
//  Created by anh  nguyen viet on 9/15/16.
//  Copyright © 2016 anhnguyenviet. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var tf_userName: UITextField!
    @IBOutlet weak var tf_password: UITextField!
    
    var database = DataBase.sharedInstance
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    func checkUser(user: String) -> Bool
    {
        let user = database.viewDatabase("ACCOUNTS", columns: ["AccountName"], statement: " where AccountName = '\(user)'")
        
        if user.count != 0
        {
            return true
        }
        else
        {return false}
    }
    
    func checkPassword(user: String, pass: String) -> Bool
    {
        let account = database.viewDatabase("ACCOUNTS", columns: ["Password"], statement: " where AccountName = '\(user)' AND Password = '\(pass)'")
        
        if account.count != 0
        {
            return true
        }
        return false
    }
    @IBAction func button_login(_ sender: AnyObject) {
        let currentUser = tf_userName.text
        let currentPass = tf_password.text

        
//        let acclevel = database.viewDatabase("ACCOUNTS", columns: ["AccountLevel"], statement: "where AccountName = '\(currentUser!)'")
//        var level = Int ((acclevel.first!["AccountLevel"]! as AnyObject).stringValue)
//
//        if level == 1
//        {
//        
//        }

        if checkUser(user: currentUser!) == false
        {
            print("Tai khoan ko ton tai")
            let alert = UIAlertController(title: "Alert", message: "Tai khoan ko ton tai", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)

        }
        else
        {
            //print("Sucess")
            if checkPassword(user: currentUser!, pass: currentPass!) == false
            {
                let alert = UIAlertController(title: "Alert", message: "Login fail", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            else
            {
                let acclevel = database.viewDatabase("ACCOUNTS", columns: ["AccountLevel"], statement: "where AccountName = '\(currentUser!)'")
                let level = Int ((acclevel.first!["AccountLevel"]! as AnyObject).stringValue)
                
                if level == 1
                {
                    performSegue(withIdentifier: "showManager", sender: nil)
                }
                if level == 2
                {
                    performSegue(withIdentifier: "showChef", sender: nil)

                }
                else
                {
                    performSegue(withIdentifier: "showOrder", sender: nil)

                }
                //print("Login success")
            }
        }
    
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if (segue.identifier == "showOrder")
//        {
//            let nav = segue.destination as! UINavigationController
//            let showMoreVC = nav.topViewController as! OrderViewController
//            
//        }

        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
