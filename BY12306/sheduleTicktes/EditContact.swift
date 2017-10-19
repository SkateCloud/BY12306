//
//  EditContact.swift
//  BY12306
//
//  Created by Mac on 2017/10/15.
//  Copyright © 2017年 Mac. All rights reserved.
//

import UIKit

class EditContact: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource,UITextFieldDelegate
{

    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var certiNumberTextField: UITextField!
    var passenger: String!
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        passenger = nameTextField.text! + "       学生 " + certiNumberTextField.text!
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch buttonTag {
        case 1:
            return gendarArray.count
        case 3:
            return stateArray.count
        case 4:
            return certiTypeArray.count
        default:
            return passengerTypeArray.count
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch buttonTag {
        case 1:
            return gendarArray[row]
        case 3:
            return stateArray[row]
        case 4:
            return certiTypeArray[row]
        default:
            return passengerTypeArray[row]
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch buttonTag {
        case 1:
            gendarButton.setTitle(gendarArray[row].description, for: .normal)
        case 3:
            stateButton.setTitle(stateArray[row].description, for: .normal)
        case 4:
            certiTypeButton.setTitle(certiTypeArray[row], for: .normal)
        default:
            passengerTypeButton.setTitle(passengerTypeArray[row], for: .normal)
        }
    }

//跳出pickerview的button
    @IBOutlet weak var gendarButton: UIButton! //tag = 1
    @IBOutlet weak var birthDateButton: UIButton! //tag = 2
    @IBOutlet weak var stateButton: UIButton! //tag = 3
    @IBOutlet weak var certiTypeButton: UIButton! //tag = 4
    @IBOutlet weak var passengerTypeButton: UIButton! //tag = 5
//跳出pickerview的action
    @IBAction func chooseGendar(_ sender: UIButton) {
        buttonTag = 1
        pickerView = UIPickerView(frame: CGRect(x: 0, y: 420, width: self.view.frame.width-40, height: 130))
        pickerView.selectRow(2, inComponent: 0, animated: true)
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.tag = 6
        sureButton = UIButton(frame: CGRect(x: 0, y: 420, width: 40, height: 30))
        sureButton.backgroundColor = .lightGray
        sureButton.setTitle("确定", for: .normal)
        sureButton.addTarget(self, action: #selector(EditContact.dismissPickerView), for: .touchUpInside)
        sureButton.tag = 7
        self.view.addSubview(pickerView)
        self.view.addSubview(sureButton)
    }
    @IBAction func chooseBirthDate(_ sender: UIButton) {
        buttonTag = 2
        datePicker = UIDatePicker(frame: CGRect(x: 0, y: 420, width: self.view.frame.width-40, height: 130))
        datePicker.datePickerMode = .date
        datePicker.locale = Locale(identifier: "zh_TW")
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let fromDateTime = formatter.date(from: "1950-01-01")
        datePicker.minimumDate = fromDateTime
        let toDateTime = formatter.date(from: "2010-01-01")
        datePicker.maximumDate = toDateTime
        datePicker.addTarget(self, action: #selector(EditContact.datePickerChanged), for: .valueChanged)
        datePicker.tag = 8
        sureButton = UIButton(frame: CGRect(x: 0, y: 420, width: 40, height: 30))
        sureButton.setTitle("确定", for: .normal)
        sureButton.tag = 7
        sureButton.backgroundColor = .lightGray
        sureButton.addTarget(self, action: #selector(EditContact.dismissDatePicker), for: .touchUpInside)
        self.view.addSubview(datePicker)
        self.view.addSubview(sureButton)
    }
    @objc func datePickerChanged() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        birthDateButton.setTitle(formatter.string(from: datePicker.date), for: .normal)
    }
    @objc func dismissDatePicker() {
        self.view.viewWithTag(7)?.removeFromSuperview()
        self.view.viewWithTag(8)?.removeFromSuperview()
    }
    @IBAction func chooseState(_ sender: UIButton) {
        buttonTag = 3
        pickerView = UIPickerView(frame: CGRect(x: 0, y: 420, width: self.view.frame.width-40, height: 130))
        pickerView.selectRow(2, inComponent: 0, animated: true)
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.tag = 6
        sureButton = UIButton(frame: CGRect(x: 0, y: 420, width: 40, height: 30))
        sureButton.backgroundColor = .lightGray
        sureButton.setTitle("确定", for: .normal)
        sureButton.addTarget(self, action: #selector(EditContact.dismissPickerView), for: .touchUpInside)
        sureButton.tag = 7
        self.view.addSubview(pickerView)
        self.view.addSubview(sureButton)
    }
    @IBAction func chooseCertiType(_ sender: UIButton) {
        buttonTag = 4
        pickerView = UIPickerView(frame: CGRect(x: 0, y: 420, width: self.view.frame.width-40, height: 130))
        pickerView.selectRow(2, inComponent: 0, animated: true)
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.tag = 6
        sureButton = UIButton(frame: CGRect(x: 0, y: 420, width: 40, height: 30))
        sureButton.backgroundColor = .lightGray
        sureButton.setTitle("确定", for: .normal)
        sureButton.addTarget(self, action: #selector(EditContact.dismissPickerView), for: .touchUpInside)
        sureButton.tag = 7
        self.view.addSubview(pickerView)
        self.view.addSubview(sureButton)
    }
    @IBAction func choosePassengerType(_ sender: UIButton) {
        buttonTag = 5
        pickerView = UIPickerView(frame: CGRect(x: 0, y: 420, width: self.view.frame.width-40, height: 130))
        pickerView.selectRow(2, inComponent: 0, animated: true)
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.tag = 6
        sureButton = UIButton(frame: CGRect(x: 0, y: 420, width: 40, height: 30))
        sureButton.backgroundColor = .lightGray
        sureButton.setTitle("qued", for: .normal)
        sureButton.addTarget(self, action: #selector(EditContact.dismissPickerView), for: .touchUpInside)
        sureButton.tag = 7
        self.view.addSubview(pickerView)
        self.view.addSubview(sureButton)
    }
    @objc func dismissPickerView() {
        self.view.viewWithTag(6)?.removeFromSuperview()
        self.view.viewWithTag(7)?.removeFromSuperview()
    }
    
    let gendarArray = ["男","女"]
    let stateArray = ["中国CHINA","美国UNITEDSTATES","澳大利亚AUSTRALIA","奥地利AUSTRALIA","比利时BELGIUM","不丹BHUTAN","巴西BRAZIL","保加利亚BULGARIA","加拿大CANADA","古巴共和国CUBA","荷兰HOLLAND","印度INDIA","日本JAPAN","韩国KOREA","墨西哥MOXICO","新西兰NEWZEALAND","波兰POLAND","葡萄牙PORTUGAL","俄罗斯RUSSIA","西班牙SPAIN","瑞典SWIDEN","瑞士SWITZERLAND","泰国THAILAND"]
    let certiTypeArray = ["二代身份证","港澳居民来往内地通行证","台湾居民来往大陆通行证","护照"]
    let passengerTypeArray = ["成人","儿童","学生","残军"]
    var pickerView: UIPickerView! = nil
    var sureButton: UIButton! = nil
    var datePicker: UIDatePicker! = nil
    var buttonTag = 0
    
    @IBAction func sureToAddContact(_ sender: UIButton) {
        let alertController = UIAlertController(title: "提示", message: "已保存", preferredStyle: .alert)
        let YESAction = UIAlertAction(title: "确定", style: .default, handler: nil)
        alertController.addAction(YESAction)
        let addpassenger = AddPassengerTable()
        var array = addpassenger.passengerArray
        self.present(alertController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
