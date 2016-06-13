//
//  PersonDetails.swift
//  TestSample
//
//  Created by vishnukanth on 13/06/16.
//  Copyright © 2016 Inteliment. All rights reserved.
//

import Foundation
class PersonDetails {
    
    var imageData: NSData
    var title: String
    var subTilte: String
    var date  : String
    
    
    init(data: NSData, tempT: String, tempST: String, tempd: String) {
        self.imageData = data
        self.title = tempT
        self.subTilte = tempST
        self.date = tempd
    }
    
    func returnData() -> NSData {
        return self.imageData
    }
    
    func getTitle() -> String {
        
        return self.title
        
    }
    
    func getSubTitle() -> String {
        
        return self.subTilte
        
    }
    
    func getDate() -> String {
        
        return self.date
        
    }
    
}