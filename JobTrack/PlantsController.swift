//
//  PlantsController.swift
//  JobTrack
//
//  Created by Vagmi on 31/08/15.
//  Copyright © 2015 Vagmi. All rights reserved.
//

import UIKit
import FontAwesome_swift
import Eddystone

class PlantsController: UITabBarController, Eddystone.ScannerDelegate {
    var urls = Eddystone.Scanner.nearbyUrls
    var previousUrls: [Eddystone.Url] = []
    var isLocating:Bool = true

    let plants:[Plant] = Plant.generatePlants()
    let icons:[String:UIImage] = [
        "sheetMetal": UIImage(named: "sheetMetal")!,
        "dieCast": UIImage(named: "dieCast")!,
        "paint": UIImage.fontAwesomeIconWithName(FontAwesome.PaintBrush, textColor: UIColor.blackColor(), size: CGSize(width: 30, height: 30)),
        "assembly": UIImage.fontAwesomeIconWithName(FontAwesome.Wrench, textColor: UIColor.blackColor(), size: CGSize(width: 30, height: 30))
    ]

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        var controllers:[PlantController] = plants.map { (plant) -> PlantController in
            var plantController = storyBoard.instantiateViewControllerWithIdentifier("PlantController") as! PlantController
            plantController.plant = plant
            plantController.tabBarItem = UITabBarItem(title: plant.name,
                image: icons[plant.icon],
                selectedImage: icons[plant.icon])
            return plantController
        }
        self.setViewControllers(controllers, animated: false)
        NSLog("we are here")
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        Eddystone.Scanner.start(self)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    func eddystoneNearbyDidChange() {
        self.previousUrls = urls
        let tokens = ["plant1", "plant2", "plant3", "plant4"]
        self.urls = Eddystone.Scanner.nearbyUrls

        if(self.urls.count > 0 && self.isLocating) {
            let path = "http://tarkalabs.com/"
            let urlString = self.urls[0].url.absoluteString
            if(urlString.hasPrefix("http://tarkalabs.com/")) {
                let range = Range<String.Index>(start: path.endIndex, end: urlString.endIndex.advancedBy(-1))
                let tag = urlString.substringWithRange(range)
                if let idx = tokens.indexOf(tag) {
                    self.selectedIndex = idx
                }
            }
            
        }
    }


}
