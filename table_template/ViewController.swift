//
//  ViewController.swift
//  ProjectV1
//
//  Created by DE DPU on 5/4/2559 BE.
//  Copyright © 2559 Kimhore. All rights reserved.
//

import UIKit
import SwiftyJSON

class ViewController: UIViewController, KumulosDelegate {
    var kumulos : Kumulos?
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var uiuser: UILabel!
    @IBOutlet weak var uipassword: UILabel!
    @IBOutlet weak var imageyoutube: UIImageView!
    @IBOutlet weak var Password: UITextField!
   var someusername = [String]()
     var somepassword = [String]()
     var usernamess = ""
      override func viewDidLoad() {
        super.viewDidLoad()
        kumulos = Kumulos()
        kumulos?.delegate = self
        kumulos!.selectUserWithUsername("")
         username.layer.borderWidth = 2.0
        username.backgroundColor = UIColor.whiteColor()
        username.layer.cornerRadius = 8
        username.layer.masksToBounds = true
         Password.layer.borderWidth = 2.0
        Password.backgroundColor = UIColor.whiteColor()
        Password.layer.cornerRadius = 8
        Password.layer.masksToBounds = true
        imageyoutube.layer.cornerRadius = 8
        imageyoutube.layer.masksToBounds = true
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        kumulos!.selectUserWithUsername(" ")
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func Logins(sender: AnyObject) {
        
        var i :Int = 0
        var j :Int = 0
        var v :Int = 0
        for item in someusername {
            if (item.isEqual(username.text)) {
                  for items in somepassword {
                    if (items.isEqual(Password.text)) {
                            NSLog("Login SUCCESS");
                            let vc = self.storyboard?.instantiateViewControllerWithIdentifier("YoutubeViewController") as! YoutubeViewController
                            self.presentViewController(vc, animated: true, completion: nil)
                        v = 1
                    }else{
                    i = 2
                    }
                }
                 j = 1
            }else{
            i = 1
            }
        }
        
        if(i == 1 && j == 0){
            let alertController = UIAlertController(title: "Error", message:
                "Username", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)

        }else if(i == 2 && v == 0) {
            let alertController = UIAlertController(title: "Error", message:
                "Password", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)
        }else if(i == 0){
            let alertController = UIAlertController(title: "Error", message:
                "ไม่มีอยู่ในระบบ", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
            
            self.presentViewController(alertController, animated: true, completion: nil)

        }

        
    }
    
    func kumulosAPI(kumulos: Kumulos!, apiOperation operation: KSAPIOperation!, selectUserDidCompleteWithResult theResults: [AnyObject]!) {
      //  print("+++++++++++++++++++")
        print(theResults)
        
        let json = JSON(theResults)
  //      print("+++++++++++++++++++")
        for (var i = 0; i<json.count;i=i+1){
        var usernames = json[i]["username"].stringValue
        var password = json[i]["password"].stringValue
            someusername.append(usernames)
            somepassword.append(password)
               print("+++++++++++++++++++")
            print(json[i]["password"].stringValue)
               print("+++++++++++++++++++")
            
        }
    }
    
    
    
    
}

