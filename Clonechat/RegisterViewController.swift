//
//  RegisterViewController.swift
//  Clonechat
//
//  Created by Vineeth Puli on 11/30/16.
//  Copyright © 2016 HirDaysOfTheWeek. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var registerBtn: UIButton!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doRegister(_ sender: Any) {
        let username = usernameField.text
        let password = passwordField.text
        let email = emailField.text
        
        Networking.register(userId: username!, email: email!, password: password!, completionHandler: {
            response, error in
            
            let status = (response?.status)!
            if status == "ok" {
                self.performSegue(withIdentifier: "registrationSuccessful", sender: self)
            } else {
                let message:String = (response?.message)!
            }
        })
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
