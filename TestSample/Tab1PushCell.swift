//
//  Tab1PushCell.swift
//  TestSample
//
//  Created by vishnukanth on 12/06/16.
//  Copyright © 2016 Inteliment. All rights reserved.
//

import UIKit

class Tab1PushCell: UITableViewCell
{
    @IBOutlet weak var pushLabel : UILabel!
    @IBOutlet weak var modalLabel : UILabel!
    @IBOutlet weak var toggleSwitch :UISwitch!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
