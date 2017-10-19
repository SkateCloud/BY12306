//
//  BusinessTableViewController.swift
//  BY12306
//
//  Created by Mac on 2017/10/11.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit

class BusinessTableViewController: UITableViewController {

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BusinessCell") as! UITableViewCell
        cell.layer.cornerRadius = 12
        cell.selectionStyle = .none
        switch indexPath.section {
        case 0:
            let imageview_1 = UIImageView(frame: CGRect(origin: cell.frame.origin, size: cell.bounds.size))
            imageview_1.image = UIImage(named: "image_1")
            cell.backgroundView = imageview_1
        case 1:
            let imageview_2 = UIImageView(frame: CGRect(origin: cell.frame.origin, size: cell.bounds.size))
            imageview_2.image = UIImage(named: "image_2")
            cell.backgroundView = imageview_2
        default:
            let imageview_3 = UIImageView(frame: CGRect(origin: cell.frame.origin, size: cell.bounds.size))
            imageview_3.image = UIImage(named: "image_3")
            cell.backgroundView = imageview_3
        }
        cell.backgroundColor = UIColor(displayP3Red: 240, green: 255, blue: 255, alpha: 0.8)
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
