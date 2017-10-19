//
//  My12306TableViewController.swift
//  BY12306
//
//  Created by Mac on 2017/10/11.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit

class My12306TableViewController: UITableViewController {
    let celldata = [["白云","手机核验","我的保险","我的订餐"],["出行向导","温馨服务","信息服务"],["旅行休闲"],["系统通知","关于"]]

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 4
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 4
        case 1:
            return 3
        case 2:
            return 1
        default:
            return 2
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "12306Cell") as! My12306Cell
        cell.textLabel?.text = celldata[indexPath.section][indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}
