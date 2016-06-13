//
//  ImageCollection.swift
//  TestSample
//
//  Created by vishnukanth on 12/06/16.
//  Copyright © 2016 Inteliment. All rights reserved.
//

import UIKit

private let reuseIdentifier = "cellImage"

class ImageCollection: UICollectionViewController {

    var imageURLS: [String] = ["https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTIdPXYycrW8h_QONfZrRy9SqpzLtrByXgzM424d_ZtN4krUEglIw","http://webneel.com/wallpaper/sites/default/files/images/04-2013/gorgeous-beach-wallpaper.jpg","https://trippinonlife.files.wordpress.com/2012/09/img_1130.jpg","https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcTMxPZn4TLp1Yya7tzez4xYgwVRfpX3031qTwWexEND_WWkS3j4","https://s-media-cache-ak0.pinimg.com/736x/8d/8e/1e/8d8e1e95c38229dffa9076b1848ea13a.jpg","https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcSprknoNGKczZMnS9HApcl-mJMG33wvTNmTArriuiaStDRVsM__","http://science-all.com/images/wallpapers/3d-nature-wallpaper/3d-nature-wallpaper-11.jpg","https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcRqK3GQj6S6rumchLMcljSSkgWMbltEiZyJRlkJpl6DC5L6B1keEQ","https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcSMjzhmlIkgIixW5i-qo4NN5rGCNp2p-DmMo-9u59bd9jRP1L4e","https://encrypted-tbn1.gstatic.com/images?q=tbn:ANd9GcRfnxKJ4A81VRa_mki28cfW7rckeGXHL6abZsOLgX8Q4Do2Jk49","https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTt-9ZjMDZB-C7-G9U5uzU8w69SbjjcMxZNHIgqWNCoYptwkHoQyIohBQVV","https://s-media-cache-ak0.pinimg.com/736x/65/a0/87/65a0877793f13f756f40ee917ed1031e.jpg","http://l2.yimg.com/bt/api/res/1.2/mRmIRLzqiIoPR7wMDGd_RA--/YXBwaWQ9eW5ld3M7Zmk9aW5zZXQ7aD00MjM7cT04NTt3PTYzMA--/http://l.yimg.com/os/401/2012/07/06/0219-rain-mist-JPG_131457.jpg","https://s-media-cache-ak0.pinimg.com/736x/f1/f9/29/f1f9293b8e27d6b1427dc00639c3ecf0.jpg","http://1.bp.blogspot.com/-uuVy1OL2t1c/T_rboRzG6NI/AAAAAAAABkU/XywmDnbrtm4/s1600/0249-amaravathi-3-JPG_131356.jpg","http://images.indiatvnews.com/mainnational/2014/14162412096.jpg","https://i.ytimg.com/vi/m8n2o3Qx504/maxresdefault.jpg","http://s2.dmcdn.net/JB_yE/1280x720-5K_.jpg","http://www.spothill.cz/blog/wp-content/uploads/2015/01/OxivfYp_2.jpg","http://www.dubaiexperiences.com/wp-content/uploads/2016/06/dubai-airport.png","http://www.bjornmoerman.com/United-Arab-Emirates/Architectural/i-GDLgbtZ/2/L/20130106_141442-Edit-L.jpg","http://vid.alarabiya.net/images/2016/02/01/b90cbd0c-b304-41fb-97c7-b8bb1a9aae78/b90cbd0c-b304-41fb-97c7-b8bb1a9aae78_16x9_788x442.jpg","https://c2.staticflickr.com/8/7363/12960767484_ac6da5a644_b.jpg","http://thumb.holidaypirates.com/8X0Xo5c3vJwL5CgGEZUZujLFsRY=/657x300/http://www.holidaypirates.com/media/images/2015/06/dubai-marina-1434715580-BuhW.jpg","https://cdn.getyourguide.com/img/tour_img-372390-90.jpg","http://www.e-architect.co.uk/images/jpgs/dubai/abu_dhabi_airport_terminal_i060212_4.jpg","http://static9.depositphotos.com/1561500/1189/i/950/depositphotos_11899965-Dubai-airport-terminal-by-night.jpg","http://www.airlines-inform.com/upload/reviews_pictures/1200-upload-blog-420-emirates_02.jpg?created","https://s-media-cache-ak0.pinimg.com/736x/64/9a/f4/649af483de7fce7bcd3b8c75196482fd.jpg","http://warnet.ws/img5/159/gold/1.jpg"]
    
    var cellColor = true
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
       self.collectionView!.registerClass(CollectionCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10)
        self.collectionView!.collectionViewLayout = layout

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
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return imageURLS.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cellview", forIndexPath: indexPath) as! CollectionCell
        let block: SDWebImageCompletionBlock! = {(image: UIImage!, error: NSError!, cacheType: SDImageCacheType, imageURL: NSURL!) -> Void in
            //          println(self)
        }
        let url = NSURL(string: imageURLS[indexPath.row])
        
        
        //Lazy loading through sdwebimage
        cell.lazyView.sd_setImageWithURL(url, placeholderImage: UIImage(named: "placeholder"), options: SDWebImageOptions.AllowInvalidSSLCertificates, completed: block)
        
        // Configure the cell
       // cell.lazyView.backgroundColor = cellColor ? UIColor.redColor() : UIColor.blueColor()
        
       // cellColor = !cellColor
        
        // Configure the cell
    
        return cell
    }
    
    func collectionView(collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                               sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        //device screen size
        let width = UIScreen.mainScreen().bounds.size.width
        //calculation of cell size
        return CGSize(width: ((width / 2) - 15)   , height: 155)
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}
