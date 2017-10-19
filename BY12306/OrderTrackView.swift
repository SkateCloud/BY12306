//
//  OrderTrackView.swift
//  BY12306
//
//  Created by Mac on 2017/10/12.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit

class OrderTrackView: UITableViewController {
    let ordercelldata = [["今日订单","未出行订单","历史订单"],["未完成订单"]]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "已完成订单"
        }else {
            return "未完成订单"
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.startIndex {
        case 0:
            switch indexPath.row {
            case 0:
                let alertController = UIAlertController(title: "温馨提示", message: "没有未完成订单", preferredStyle: .alert)
                let YESAction = UIAlertAction(title: "确定", style: .default, handler: nil)
                alertController.addAction(YESAction)
                self.present(alertController, animated: true, completion: nil)
            case 1:
                let alertController = UIAlertController(title: "未出行订单", message: "北京-上海 2017-3-4 8:00；天津-南京 2016-7-4 10:30；杭州-西安 2015-4-9 19:24", preferredStyle: .alert)
                let YESAction = UIAlertAction(title: "确定", style: .default, handler: nil)
                alertController.addAction(YESAction)
                self.present(alertController, animated: true, completion: nil)
            default:
                let alertController = UIAlertController(title: "历史订单", message: "天津-广州 2015-3-28 17:00；哈尔滨-青岛 2015-9-04 12:51；郑州-武汉 2016-1-16", preferredStyle: .alert)
                let YESAction = UIAlertAction(title: "确定", style: .default, handler: nil)
                alertController.addAction(YESAction)
                self.present(alertController, animated: true, completion: nil)
            }
        default:
            let alertController = UIAlertController(title: "温馨提示", message: "没有未完成订单", preferredStyle: .alert)
            let YESAction = UIAlertAction(title: "确定", style: .default, handler: nil)
            alertController.addAction(YESAction)
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 3 : 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ordertrackCell", for: indexPath) as! My12306Cell
        cell.textLabel?.text = ordercelldata[indexPath.section][indexPath.row]

        return cell
    }

}
