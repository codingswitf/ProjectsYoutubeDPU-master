//
//  TableViewCell.swift
//  table_template
//
//  Created by DE DPU on 5/11/2559 BE.
//  Copyright © 2559 Shuchen Du. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var pic: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }


    
    var Save: save?{
        didSet{
            if let save = Save, title = title, pic = pic{
                let str = save.title
                let nsString = str as NSString
                if nsString.length > 0
                {
                    title.text = nsString.substringWithRange(NSRange(location: 0, length: nsString.length > 30 ? 30 : nsString.length))
                }
                pic.image = UIImage(data: NSData(contentsOfURL: NSURL(string: (save.pic as? String)!)!)!)
            }
        }
        
    }
    
   
    
}
