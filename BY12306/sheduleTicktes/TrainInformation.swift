//
//  trainInformation.swift
//  BY12306
//
//  Created by Mac on 2017/10/18.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit

class TrainInformation: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(TrainInformation.refreshTableView), for: .valueChanged)
        refreshControl.tintColor = .blue
        refreshControl.attributedTitle = NSAttributedString(string: "刷新ing")
        self.refreshControl = refreshControl
    }
    @objc func refreshTableView() {
        self.refreshControl?.beginRefreshing()
        self.refreshTableView()
        self.refreshControl?.endRefreshing()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "trainInCell", for: indexPath)
as! UITableViewCell
        cell.selectionStyle = .none
        switch indexPath.section {
        case 0:
            let imageview_1 = UIImageView(frame: CGRect(origin: cell.frame.origin, size: cell.bounds.size))
            imageview_1.image = UIImage(named: "Train_1")
            cell.backgroundView = imageview_1
        case 1:
            let imageview_2 = UIImageView(frame: CGRect(origin: cell.frame.origin, size: cell.bounds.size))
            imageview_2.image = UIImage(named: "Train_2")
            cell.backgroundView = imageview_2
        default:
            let imageview_3 = UIImageView(frame: CGRect(origin: cell.frame.origin, size: cell.bounds.size))
            imageview_3.image = UIImage(named: "Train_3")
            cell.backgroundView = imageview_3
        }
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alertController = UIAlertController(title: "温馨提示", message: "订票完成", preferredStyle: .alert)
        let YESAction = UIAlertAction(title: "确定", style: .default, handler: nil)
        alertController.addAction(YESAction)
        self.present(alertController, animated: true, completion: nil)
    }

}
