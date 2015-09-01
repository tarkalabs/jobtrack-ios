//
//  PlantController.swift
//  JobTrack
//
//  Created by Vagmi on 31/08/15.
//  Copyright © 2015 Vagmi. All rights reserved.
//

import UIKit

class PlantController: UIViewController,UICollectionViewDataSource {

    @IBOutlet weak var viewCollection: UICollectionView!
    var plant:Plant?

    @IBOutlet weak var btnToggleListening: UIButton!
    @IBOutlet weak var shiftsCollectionView: UICollectionView!

    func initCollectionView() {
        if let jos = plant?.jobOrders {
          //viewCollection.dataSource = JobOrdersDataSource(jobOrders: jos)
          viewCollection.dataSource = self
          shiftsCollectionView.dataSource = self
          viewCollection.reloadData()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        initCollectionView()
        let plantsController = self.tabBarController! as! PlantsController
        setBtnListeningView(plantsController)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    override func viewWillAppear(animated: Bool) {
        let plantsController = self.tabBarController! as! PlantsController
        setBtnListeningView(plantsController)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        if(collectionView == viewCollection) {
            return 1
        } else if(collectionView == shiftsCollectionView) {
            return (plant?.shifts.count)!
        }
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(collectionView == self.viewCollection) {
            return (self.plant?.jobOrders.count)!
        } else {
            let itemCount = plant?.shifts[section].checkins.count
            return itemCount!
        }
    }
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        if(collectionView == viewCollection) {
            let jobOrder = self.plant?.jobOrders[indexPath.row]
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("jobOrderCell", forIndexPath: indexPath) as! JobOrderCell
            cell.layer.borderColor = UIColor.lightGrayColor().CGColor
            cell.layer.cornerRadius = 3
            cell.layer.borderWidth = 2
            cell.lblPart.text = jobOrder!.description
            cell.lblCompanyName.text = jobOrder!.client.name
            let formatter = NSDateFormatter()
            formatter.dateFormat = "dd-MMM-yyyy"
            cell.lblDate.text = formatter.stringFromDate(jobOrder!.startDate.instant().asNSDate())
            NSLog("returning cell")
            return cell
        } else {

            let checkinCell = collectionView.dequeueReusableCellWithReuseIdentifier("checkinCell", forIndexPath: indexPath) as! CheckinCell
            
            let shift = plant?.shifts[indexPath.section]
            NSLog("\(indexPath.section) \(indexPath.row)")
            let checkin = shift?.checkins[indexPath.row]
            checkinCell.imgAvatar.image = UIImage(named: (checkin?.employee.avatar)!)
            checkinCell.imgAvatar.layer.cornerRadius = 60
            checkinCell.imgAvatar.clipsToBounds = true
            return checkinCell
            
        }
    }
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        
        let checkin = plant?.shifts[indexPath.section]
        let shiftHeaderView = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "shiftHeaderView", forIndexPath: indexPath) as! ShiftHeaderView
        
        let formatter = NSDateFormatter()
        formatter.dateFormat = "dd-MMM-yyyy"
        let dateString = formatter.stringFromDate((checkin?.shiftDate.instant().asNSDate())!)
        shiftHeaderView.lblShiftDate.text = dateString
        shiftHeaderView.layer.cornerRadius = 10
        return shiftHeaderView
    }
    @IBAction func toggleListening(sender: AnyObject) {
        
        let plantsController = self.tabBarController! as! PlantsController
        plantsController.isLocating = !plantsController.isLocating
        setBtnListeningView(plantsController)

    }
    func setBtnListeningView(plantsController: PlantsController) {
        let passiveColor = UIColor(red: (220.0/255), green: (99.0/255), blue: (74.0/255), alpha: 0.9)
        let activeColor = UIColor(red: (90.0/255), green: (217.0/255), blue: (113.0/255), alpha: 0.9)
        var color = passiveColor
        if(plantsController.isLocating) {
            color = activeColor
        }

        btnToggleListening.layer.backgroundColor = color.CGColor
        btnToggleListening.layer.cornerRadius = 10

        btnToggleListening.titleLabel?.font = UIFont.fontAwesomeOfSize(30)
        btnToggleListening.setTitle(" " + String.fontAwesomeIconWithName(.MapMarker) ,forState: .Normal)
        btnToggleListening.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        NSLog("i am now \(plantsController.isLocating)")
    }

}