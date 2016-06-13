//
//  PageView.swift
//  TestSample
//
//  Created by vishnukanth on 13/06/16.
//  Copyright © 2016 Inteliment. All rights reserved.
//

import UIKit

class PageView: UIViewController,UIScrollViewDelegate
{

    @IBOutlet weak var textView:UITextView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var scrollImage: UIImageView!
    @IBOutlet weak var pageControl : UIPageControl!
    var frame: CGRect = CGRectMake(0, 0, 0, 0)
    var pageUsed : Bool = false
    
    var images: [String] = ["image1","image2","image3"];
    override func viewDidLoad()
    {
        
        
        
        pageControl.addTarget(self, action: #selector(PageView.changePage(_:)), forControlEvents: UIControlEvents.ValueChanged)
        super.viewDidLoad()

        for index in 0..<3
        {
            
            frame.origin.x = self.scrollView.frame.size.width * CGFloat(index)
            frame.size = self.scrollView.frame.size
            self.scrollView.pagingEnabled = true
            self.scrollImage.image = UIImage(named: images[index])
            
        }
        
        self.scrollView.contentSize = CGSizeMake(self.scrollView.frame.size.width * CGFloat(images.count), self.scrollView.frame.size.height)
        pageControl.numberOfPages = images.count
        pageControl.currentPage = 0;
    }
        // Do any additional setup after loading the view.
    
    func changePage(sender: AnyObject) -> () {
    print(pageControl.currentPage)
        let x = CGFloat(pageControl.currentPage) * scrollView.frame.size.width
        scrollView.setContentOffset(CGPointMake(x, 0), animated: true)
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width);
        pageControl.currentPage = Int(pageNumber+1)
        self.scrollImage.image = UIImage(named: images[pageControl.currentPage])
        
    }
    
    
    func scrollViewDidScroll(scrollView: UIScrollView)
    {
        
    }
    
    
    
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) -> () {
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width);
        pageControl.currentPage = Int(pageNumber+1)
        self.scrollImage.image = UIImage(named: images[pageControl.currentPage])
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController!.title = "Text View & Scroll View"
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
