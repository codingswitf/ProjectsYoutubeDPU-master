//
//  signup.swift
//  ProjectV1
//
//  Created by DE DPU on 5/4/2559 BE.
//  Copyright © 2559 Kimhore. All rights reserved.
//

import UIKit

class signup: UIViewController {
    
    @IBOutlet weak var user: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmpassword: UITextField!
    @IBOutlet weak var email: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        user.layer.borderWidth = 2.0
        user.backgroundColor = UIColor.whiteColor()
        user.layer.cornerRadius = 8
        user.layer.masksToBounds = true
        password.layer.borderWidth = 2.0
        password.backgroundColor = UIColor.whiteColor()
        password.layer.cornerRadius = 8
        password.layer.masksToBounds = true
        confirmpassword.layer.borderWidth = 2.0
        confirmpassword.backgroundColor = UIColor.whiteColor()
        confirmpassword.layer.cornerRadius = 8
        confirmpassword.layer.masksToBounds = true
        email.layer.borderWidth = 2.0
        email.backgroundColor = UIColor.whiteColor()
        email.layer.cornerRadius = 8
        email.layer.masksToBounds = true
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signup(sender: AnyObject) {
        if(user.text != "" && password.text != "" && confirmpassword.text != "" && email.text != ""){
        
        if(password != confirmpassword){
            let kumulosAPI = Kumulos()
            kumulosAPI.createUserWithUsername(user.text, andPassword: password.text, andEmail: email.text)
            var alert = UIAlertView(title: "Success", message: "Logged In", delegate: self, cancelButtonTitle: "OK")
            alert.show()
            
        }else{
           var alert = UIAlertView(title: "Error", message: "กรุณาใส่ให้ตรงกัน", delegate: self, cancelButtonTitle: "OK")
            alert.show()

        }
        }else{
            var alert = UIAlertView(title: "Error", message: "กรุณาใส่ข้อมูล", delegate: self, cancelButtonTitle: "OK")
            alert.show()
        }
    }
    
    
}
