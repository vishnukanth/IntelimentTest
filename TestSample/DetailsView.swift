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
    
    var pDetails = PersonDetails?()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if(pDetails?.returnData() != nil)
        {
          buttomImage .setImage(UIImage(data: pDetails!.returnData())  , forState: UIControlState.Normal)
        }
        if(pDetails?.getSubTitle() != nil)
        {
           subtitleLbl.text = pDetails?.getSubTitle()
        }
        if(pDetails?.getTitle() != nil)
        {
            titleLbl.text = pDetails?.getTitle()
        }
        if(pDetails?.getDate() != nil)
        {
            dateLbl.text = pDetails?.getDate()
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
