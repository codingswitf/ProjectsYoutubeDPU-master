//
//  MusicViewController.swift
//  table_template
//
//  Created by Shuchen Du on 2015/09/29.
//  Copyright (c) 2015年 Shuchen Du. All rights reserved.
//

import UIKit
import youtube_ios_player_helper
import RealmSwift
class MusicViewController: UIViewController {

   
   var notes: Results<save>!
    @IBOutlet weak var toptext: UILabel!
    @IBOutlet weak var player: YTPlayerView!
    @IBOutlet weak var mLab: UILabel!
    var videoID: String!
     var videoTitle: String!
    var texts: String!
       var pic: String!
    let playParam = [
        // not full screen
        "playsinline": 1
    ]
   

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mLab.text = "video id: \(videoID)"
        toptext.text = "Name : \(videoTitle)"
        self.player.loadWithVideoId(videoID, playerVars: playParam)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        print("MusicViewController memory waining...")
    }
    
    @IBAction func savevideo(sender: AnyObject) {
        saveNote() 
//        do{
//            let realm = try Realm()
//                           for(var i = 0; i<notes.lenght; i=i+1)
//                {
//                    let a =  notes[i] as save
//                    let video = a.video
//                    if(!videoID.isEqual(video)){
//                        print("save")
//                    }else{
//                        let alertController = UIAlertController(title: "Error", message:
//                            "มีเพลงอยู่แล้ว", preferredStyle: UIAlertControllerStyle.Alert)
//                        alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default,handler: nil))
//                        
//                        self.presentViewController(alertController, animated: true, completion: nil)
//                        
//                    }
//                }
//            
//            
//               notes = realm.objects(save)
//        } catch {
//            print("Handle Error")
//        }

        
           }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    
    
    func saveNote() {
        let myNote = save()
        myNote.title = toptext.text!
        myNote.video = mLab.text!
        myNote.pic = pic!
        
        do{
            let realm = try Realm()
            try realm.write(){
             realm.add(myNote)
             }
            //1
            //saves = realm.objects(save)
        } catch {
            print("Handle Error")
        }
    }

    
}
