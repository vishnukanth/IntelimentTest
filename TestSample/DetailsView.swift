//
//  DetailsView.swift
//  TestSample
//
//  Created by vishnukanth on 13/06/16.
//  Copyright © 2016 Inteliment. All rights reserved.
//

import UIKit

class DetailsView: UIViewController {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var subtitleLbl : UILabel!
    @IBOutlet weak var dateLbl : UILabel!
    @IBOutlet weak var buttomImage : UIButton!
    
    var titleStr : String!
    var subStr : String!
    var imgData : NSData!
    var dateStr : String!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if(imgData != nil)
        {
          buttomImage .setImage(UIImage(data: imgData)  , forState: UIControlState.Normal)
        }
        if(subStr != nil)
        {
           subtitleLbl.text = subStr
        }
        if(titleStr != nil)
        {
            titleLbl.text = titleStr
        }
        if(dateStr != nil)
        {
            dateLbl.text = dateStr
        }
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
