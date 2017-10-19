//
//  AddPassengerTable.swift
//  BY12306
//
//  Created by Mac on 2017/10/14.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit

class AddPassengerTable: UITableViewController {

    var passengerArray = ["白云        学生 412***********0021",
                          "张念贤      学生 130***********1647",
                          "周雨贝      学生 440***********1523"]

    @IBAction func unwindToMealList(sender: UIStoryboardSegue) {
        if let editcontact = sender.source as? EditContact,let passenger = editcontact.passenger {
            let newIndexpath = IndexPath(row: passengerArray.count, section: 0)
            passengerArray.append(passenger)
            tableView.insertRows(at: [newIndexpath], with: .automatic)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return passengerArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "passengerCell", for: indexPath) as! UITableViewCell
        cell.textLabel?.text = passengerArray[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alertController = UIAlertController(title: "温馨提示", message: "您是要购买学生票吗（须凭购票时所使用的有效身份证原件和附有学生火车票优惠卡的有效学生证原件换票乘车，详见购买学生票有关规定。如不符合相关规定，请点击“否”）", preferredStyle: .alert)
        let NoAction = UIAlertAction(title: "否", style: .cancel, handler: nil)
        let YESAction = UIAlertAction(title: "是", style: .default, handler: { (action) in
            tableView.cellForRow(at: indexPath)?.backgroundColor = UIColor.red
        })
        alertController.addAction(NoAction)
        alertController.addAction(YESAction)
        self.present(alertController,animated: true,completion: nil)
    }
    
}
