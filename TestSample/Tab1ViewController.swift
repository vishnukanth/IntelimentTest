//
//  Tab1ViewController.swift
//  TestSample
//
//  Created by vishnukanth on 12/06/16.
//  Copyright © 2016 Inteliment. All rights reserved.
//

import UIKit
import AVFoundation
import AudioToolbox
class Tab1ViewController: UIViewController {

    var torchValue : Bool = false
    private var dpShowDateVisible = false
    @IBOutlet weak var Tab1TableView: UITableView?
    var tempPicker: UIDatePicker!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        //self.Tab1TableView!.rowHeight = UITableViewAutomaticDimension
        print("Hello World");
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int
    {
        return 5;
    }
    
    func tableView(tableView: UITableView!,
                   cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!
    {
        var cell :Tab1PushCell!
        if indexPath.row == 0
        {
            cell = tableView.dequeueReusableCellWithIdentifier("pushcell", forIndexPath: indexPath) as! Tab1PushCell
            
            //set the data here
            
        }
        
        if indexPath.row == 1 {
            cell = tableView.dequeueReusableCellWithIdentifier("modalview", forIndexPath: indexPath) as! Tab1PushCell
        }
        if indexPath.row == 2 {
            cell = tableView.dequeueReusableCellWithIdentifier("switchview", forIndexPath: indexPath) as! Tab1PushCell
            //set the data here
            if(torchValue == false)
            {
                cell.toggleSwitch.on = false;
                
            }
            else
            {
                cell.toggleSwitch.on = true;
            }
            cell.toggleSwitch.addTarget(self, action: #selector(Tab1ViewController.switchChanged(_:)), forControlEvents: UIControlEvents.ValueChanged)
            
            
        }
        
        if indexPath.row == 3{
            cell = tableView.dequeueReusableCellWithIdentifier("datainputview", forIndexPath: indexPath) as! Tab1PushCell
            if(dpShowDateVisible)
            {
                let dateFormatter = NSDateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd"
                let dateString = dateFormatter.stringFromDate(tempPicker.date)
                cell.dateInputField.text = dateString
            }
            
        }
        
        if indexPath.row == 4{
            cell = tableView.dequeueReusableCellWithIdentifier("datepickerview", forIndexPath: indexPath) as! Tab1PushCell
            cell.datePicker .addTarget(self, action: #selector(Tab1ViewController.dateChanged(_:)), forControlEvents: UIControlEvents.ValueChanged)
        }
        
        return cell
    }
    
     func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
     {
        
        if indexPath.row == 3 {
            //Hide and Show date picker by selecting cell
            toggleShowDateDatepicker()
        }
    
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func tableView(tableView:UITableView,heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        
        var height:CGFloat = self.Tab1TableView!.rowHeight
        
        if (indexPath.row == 4)
        {
            height = dpShowDateVisible ? 200.0 : 0.0
            
        }
        
        if (indexPath.row == 3)
        {
            height = 89.0
            
        }
        
        return height;
    }
    
    private func toggleShowDateDatepicker () {
        dpShowDateVisible = !dpShowDateVisible
        
        Tab1TableView!.beginUpdates()
        Tab1TableView!.endUpdates()
    }
    
    
    
    func dateChanged(picker:UIDatePicker)
  {
    tempPicker = picker;
    print(tempPicker.date)
    Tab1TableView?.reloadData()
    
  }
    
    //Switch method for TorchMode
    func switchChanged(mySwitch: UISwitch)
    {
        let device: AVCaptureDevice? = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
        if(device! .hasTorch == true)
        {
            if(device!.torchMode == AVCaptureTorchMode.On)
            {
                self.turnTorchOnInFlashMode()
            }
            else
            {
                var isdevice :Bool = false
                var devicehastorch :Bool = false
                var devicehasFlash :Bool = false
                
                if device != nil
                {
                    isdevice = true
                }
                if(device!.hasTorch)
                {
                    devicehastorch = true
                }
                    
                if(device!.hasFlash)
                {
                    devicehasFlash = true
                }
                
                
                if (isdevice && devicehasFlash  && devicehastorch)
                {
                    self.turnTorchOnInFlashMode()
                }
                
            }
        }
        else
        {
            let alert=UIAlertController(title: "Warning", message: "Flash light not supported", preferredStyle: UIAlertControllerStyle.Alert);
            
            //no event handler (just close dialog box)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Cancel, handler: nil));
            presentViewController(alert, animated: true, completion: nil);
            Tab1TableView?.reloadData()
        }
        
        //let value = mySwitch.on
        // Do something
    }
    
    
    // Method to handle torch mode ON/OFF
    func turnTorchOnInFlashMode() -> Void
    {
        let device:AVCaptureDevice? = AVCaptureDevice.defaultDeviceWithMediaType(AVMediaTypeVideo)
        do
        {
            try device!.lockForConfiguration()
            if(torchValue == true)
            {
                device!.torchMode = AVCaptureTorchMode.Off
                device!.flashMode = AVCaptureFlashMode.Off
                torchValue = false
            }
            else
            {
                device!.torchMode = AVCaptureTorchMode.On
                device!.flashMode = AVCaptureFlashMode.On
                torchValue = true
            }
            
            device!.unlockForConfiguration()
            
            Tab1TableView?.reloadData()
        }
        catch
        {
            // handle error
            return
        }
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController!.navigationController?.navigationBar.topItem?.title = "Main View"
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
