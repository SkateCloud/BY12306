//
//  ViewController.swift
//  BY12306
//
//  Created by Mac on 2017/10/11.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit

class ViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var itemNameArray = [#imageLiteral(resourceName: "Item_tickets"),#imageLiteral(resourceName: "Item_business"),#imageLiteral(resourceName: "Item_order"),#imageLiteral(resourceName: "Item_my")]
        let items = self.tabBar.items
        for i in 0..<items!.count{
            items![i].image = itemNameArray[i].withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

