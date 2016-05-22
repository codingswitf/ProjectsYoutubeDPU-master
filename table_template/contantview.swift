//
//  contantview.swift
//  table_template
//
//  Created by DE DPU on 5/11/2559 BE.
//  Copyright © 2559 Shuchen Du. All rights reserved.
//

import UIKit
import RealmSwift
class contantview: UITableViewController {
       var selectedNoted: save?
    var valueToPass:String!

   
    @IBOutlet var tabbar: UITableView!
    
 
    var notes: Results<save>! {
        didSet {
            tableView.reloadData()
        }
    }

    var getname : String!
       override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        do{
            let realm = try Realm()
            notes = realm.objects(save)
            /*try realm.write(){
             realm.add(myNote)
             }*/
            //1
            //notes = realm.objects(Note)
        } catch {
            print("Handle Error")
        }

//        let myNote = save()
//        myNote.title = "Super Simple Test Note"
//        myNote.video = "A long piece of content"
//        
//        
//        do {
//            let realm = try Realm()
//            try realm.write() {
//                realm.add(myNote)
//            }
//            // 1
//            notes = realm.objects(save)
//        } catch {
//            print("handle error")
//        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillDisappear(animated)
        do{
            let realm = try Realm()
            try realm.write() {
           
                        }
            notes = realm.objects(save)
        }catch{
            print("Handle Error")
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if let id = segue.identifier {
            switch id {
            case "Showyoutube":
                
                let detailViewController = segue.destinationViewController as! MusicViewController
                let myIndexPath = self.tableView.indexPathForSelectedRow!
                let row = myIndexPath.row
                print("/////////////////////////////////")
                print(notes[row] as save)
                print("/////////////////////////////////")
                let a =  notes[row] as save
                let title = a.title
                let video = a.video
                detailViewController.videoTitle = title as! String
                detailViewController.videoID = video as! String
                print("---------------------------------")
              
                print("---------------------------------")
                
                //                let nvc = segue.destinationViewController as! UINavigationController
                //                let dvc = nvc.childViewControllers[0] as! MusicViewController
                //                let id = self.videoTable.indexPathForCell(sender as! MyCell)!
                //                dvc.videoID = videosArray[id.row]["videoID"] as! String
                //                dvc.videoTitle = videosArray[id.row]["title"] as! String
                
            default:
                break
            }
        }
    }

    

    
}

extension contantview{
        override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("NoteCell", forIndexPath: indexPath) as! TableViewCell
        //        cell.title?.text = "Hello World"
        //         cell.date?.text = "Today"
        let row = indexPath.row
        let note = notes[row] as save
        cell.Save = note
        return cell
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        //        return 5
        return notes?.count ?? 0
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        //1
        selectedNoted = notes[indexPath.row]
        
        //2
        
    }
    //3
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool{
        return true
    }
    //4
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath){
        
        if editingStyle == .Delete{
            let note = notes[indexPath.row] as Object
            
            do{
                let realm = try Realm()
                try realm.write(){
                    realm.delete(note)
                    
                }
                
                notes = realm.objects(save)
            } catch{
                print("handle Error")
            }
        }
    }
    
   


}
