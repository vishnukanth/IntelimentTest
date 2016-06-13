//
//  DismissSegue.swift
//  TestSample
//
//  Created by vishnukanth on 13/06/16.
//  Copyright © 2016 Inteliment. All rights reserved.
//

import UIKit

class DismissSegue: UIStoryboardSegue
{
    override func perform() {
        
        let sourceViewController:UIViewController = self.sourceViewController
        
        sourceViewController.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
        
    }
}
