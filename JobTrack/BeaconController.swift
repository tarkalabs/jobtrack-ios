//
//  BeaconController.swift
//  JobTrack
//
//  Created by Vagmi on 30/08/15.
//  Copyright (c) 2015 Vagmi. All rights reserved.
//

import UIKit
import CoreLocation
import Eddystone

class BeaconController: UIViewController, Eddystone.ScannerDelegate {
    var urls = Eddystone.Scanner.nearbyUrls
    var previousUrls: [Eddystone.Url] = []
    
    @IBOutlet weak var lblBeaconURL: UILabel!
    @IBOutlet weak var lblRange: UILabel!
    override func viewDidLoad() {

        super.viewDidLoad()
        Eddystone.Scanner.start(self)
        NSLog("Set beacon manager")

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillDisappear(animated: Bool) {

    }
    func eddystoneNearbyDidChange() {
        self.previousUrls = urls
        
        self.urls = Eddystone.Scanner.nearbyUrls
        self.urls.forEach {
            NSLog($0.url.absoluteString);
            
            NSLog(String($0.beacon.distance));
            NSLog(String($0.beacon.txPower));
        }
        if(self.urls.count > 0) {
            let path = "http://tarkalabs.com/"
            lblBeaconURL.text = self.urls[0].url.absoluteString.substringFromIndex(path.endIndex)

        }
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


