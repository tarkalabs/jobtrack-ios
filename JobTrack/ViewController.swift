//
//  ViewController.swift
//  JobTrack
//
//  Created by Vagmi on 28/08/15.
//  Copyright (c) 2015 Vagmi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource {
    let plant = Plant(name: "Test Plant", icon: "sheetMetal")
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier("employeeCell", forIndexPath: indexPath) as! EmployeeCell
//        let employee = plant.employees[indexPath.row]
//        let avatar = UIImage(named: employee.avatar)
//        cell.lblName?.text = employee.name
//        cell.imgAvatar?.image = avatar
//        cell.imgAvatar?.layer.cornerRadius = 90
//        cell.imgAvatar?.clipsToBounds = true
        return cell
    }

}

