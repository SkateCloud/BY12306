import UIKit
//存储信息用于发送查询请求
struct InquireInformation {
    var locationA : String
    var locationB : String
    var depatureDate : Date
    var depatureTime : Date
    var seatLevel : String
    var isStudent : Bool
    init(locationA : String,locationB: String,depatureDate : Date,depatureTime: Date,seatLevel : String,isStudent : Bool) {
        self.locationA = ""
        self.locationB = ""
        self.depatureDate = Date()
        self.depatureTime = Date()
        self.seatLevel = ""
        self.isStudent = false
    }
}

class SheduleTicketsViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    var buttonArray = [UIButton]()
    var boolButtonArray = [Bool]()
    var SureButton : UIButton!
    var pickerView : UIPickerView!
    var datePicker : UIDatePicker!
    var location : String!
    var tag : Int!
    var isStudent : Bool = false
    let locationArray = ["北京","上海","广州","深圳","成都","杭州","武汉","重庆","南京","天津","苏州","西安","长沙","沈阳","青岛","郑州","大连","东莞","宁波"]
    let arr = ["00:00-24:00","00:00-06:00","06:00-12:00","12:00-18:00","18:00-24:00"]
    let levelArray = ["不限","商务座","特等座","一等座","二等座","二等","高级软卧","软卧","硬卧","软座","硬座"]
    @IBAction func chooseSeatLevel(_ sender: UIButton) {
        pickerView = UIPickerView(frame: CGRect(x: 40, y: 470, width: self.view.frame.width-40, height: 140))
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.selectRow(0, inComponent: 0, animated: true)
        pickerView.tag = 7
        SureButton = UIButton(frame: CGRect(x: 0, y: 470, width: 40, height: 30))
        SureButton.tag = 4
        SureButton.setTitle("确定", for: .normal)
        SureButton.backgroundColor = .lightGray
        SureButton.addTarget(self, action: #selector(SheduleTicketsViewController.didmisspickerView_C), for: .touchUpInside)
        self.view.addSubview(pickerView)
        self.view.addSubview(SureButton)
    }
    @objc func didmisspickerView_C() {
        self.view.viewWithTag(7)?.removeFromSuperview()
        self.view.viewWithTag(4)?.removeFromSuperview()
    }
    @IBAction func chooseDepaturedate(_ sender: UIButton) {
        tag = sender.tag
        datePicker = UIDatePicker(frame: CGRect(x: 40, y: 470, width: self.view.frame.width-40, height: 140))
        datePicker.datePickerMode = .date
        datePicker.locale = Locale(identifier: "zh_TW")
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let fromDateTime = formatter.date(from: "2017-10-13")
        datePicker.minimumDate = fromDateTime
        datePicker.tag = 5
        let toDateTime = formatter.date(from: "2018-01-01")
        datePicker.maximumDate = toDateTime
        datePicker.addTarget(self, action: #selector(SheduleTicketsViewController.datePickerChanged), for: .valueChanged)
        SureButton = UIButton(frame: CGRect(x: 0, y: 470, width: 40, height: 30))
        SureButton.setTitle("确定", for: .normal)
        SureButton.tag = 4
        SureButton.backgroundColor = .lightGray
        SureButton.addTarget(self, action: #selector(SheduleTicketsViewController.dismisspickerView_C), for: .touchUpInside)
        self.view.addSubview(datePicker)
        self.view.addSubview(SureButton)
    }
    @IBAction func chooseDepatureTime(_ sender: UIButton) {
        pickerView = UIPickerView(frame: CGRect(x: 40, y: 470, width: self.view.frame.width-40, height: 140))
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.selectRow(0, inComponent: 0, animated: true)
        pickerView.tag = 6
        SureButton = UIButton(frame: CGRect(x: 0, y: 470, width: 40, height: 30))
        SureButton.setTitle("确定", for: .normal)
        SureButton.backgroundColor = .lightGray
        SureButton.tag = 4
        SureButton.addTarget(self, action: #selector(SheduleTicketsViewController.didmisspickerView_B), for: .touchUpInside)
        self.view.addSubview(pickerView)
        self.view.addSubview(SureButton)
    }
    @objc func dismisspickerView_C() {
        self.view.viewWithTag(5)?.removeFromSuperview()
        self.view.viewWithTag(4)?.removeFromSuperview()
    }
    @objc func datePickerChanged() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        depatureDateButton.setTitle(formatter.string(from: datePicker.date), for: .normal)
    }
    @IBOutlet weak var locationAButton: UIButton!
    @IBOutlet weak var locationBButton: UIButton!
    @IBAction func exchangeLA_and_LB(_ sender: UIButton) {
        let locationA = locationAButton.titleLabel?.text
        let locationB = locationBButton.titleLabel?.text
        locationAButton.titleLabel?.text = locationB
        locationBButton.titleLabel?.text = locationA
    }
    @IBOutlet weak var depatureDateButton: UIButton!
    @IBOutlet weak var depatureTimeButton: UIButton!
    @IBOutlet weak var seatLevelButton: UIButton!
    @IBOutlet weak var addpassengerButton: UIButton!
    @IBAction func IsStudent(_ sender: UIButton) {
        if isStudent {
            sender.setTitle("✘", for: .normal)
        } else {
            sender.setTitle("✔︎", for: .normal)
        }
        isStudent = !isStudent
    }
    @IBAction func showPickerView(_ sender: UIButton) {
        tag = sender.tag
        pickerView = UIPickerView(frame: CGRect(x: 40, y: 470, width: self.view.frame.width-40, height: 140))
        pickerView.delegate = self
        pickerView.dataSource = self
        pickerView.selectRow(20, inComponent: 0, animated: true)
        pickerView.tag = 3
        SureButton = UIButton(frame: CGRect(x: 0, y: 470, width: 40, height: 30))
        SureButton.setTitle("确定", for: .normal)
        SureButton.backgroundColor = .lightGray
        SureButton.tag = 4
        SureButton.addTarget(self, action: #selector(SheduleTicketsViewController.dismisspickerView), for: .touchUpInside)
        self.view.addSubview(pickerView)
        self.view.addSubview(SureButton)
    }
    @objc func dismisspickerView() {
        self.view.viewWithTag(3)?.removeFromSuperview()
        self.view.viewWithTag(4)?.removeFromSuperview()
        (self.view.viewWithTag(tag) as! UIButton).setTitle(location, for: .normal)
    }
    @objc func didmisspickerView_B() {
        self.view.viewWithTag(6)?.removeFromSuperview()
        self.view.viewWithTag(4)?.removeFromSuperview()
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int
    {
        switch pickerView.tag {
        case 6:
            return arr.count
        case 7:
            return levelArray.count
        default:
            return locationArray.count
        }
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 30
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch pickerView.tag {
        case 6:
            return arr[row]
        case 7:
            return levelArray[row]
        default:
            return locationArray[row]
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView.tag {
        case 6:
            depatureTimeButton.setTitle(arr[row], for: .normal)
        case 7:
            seatLevelButton.setTitle(levelArray[row], for: .normal)
        default:
            location = locationArray[row]
        }
    }
    
    @IBOutlet weak var AllKindTrailButton: UIButton!
    @IBOutlet weak var GDCTrailButton: UIButton!
    @IBOutlet weak var ZTrailButton: UIButton!
    @IBOutlet weak var TTrailButton: UIButton!
    @IBOutlet weak var KTrailButton: UIButton!
    @IBOutlet weak var OtherTrailButton: UIButton!
    @IBAction func selectAllKindTrailButton(_ sender: UIButton) {
        boolButtonArray[0] = true
        AllKindTrailButton.backgroundColor = UIColor.lightGray
        for i in 1...5 {
            if boolButtonArray[i] == true {
                buttonArray[i].backgroundColor = UIColor.white
                boolButtonArray[i] = !boolButtonArray[i]
            }
        }
    }
    @IBAction func selectGDCButton(_ sender: UIButton) {
        GDCTrailButton.backgroundColor = UIColor.lightGray
        boolButtonArray[1] = true
        if boolButtonArray[0] {
            boolButtonArray[0] = !boolButtonArray[0]
            AllKindTrailButton.backgroundColor = .white
        }
    }
    @IBAction func selectZButton(_ sender: UIButton) {
        ZTrailButton.backgroundColor = UIColor.lightGray
        boolButtonArray[2] = true
        if boolButtonArray[0] {
            boolButtonArray[0] = !boolButtonArray[0]
            AllKindTrailButton.backgroundColor = .white
        }
    }
    @IBAction func selectTButton(_ sender: UIButton) {
        TTrailButton.backgroundColor = UIColor.lightGray
        boolButtonArray[3] = true
        if boolButtonArray[0] {
            boolButtonArray[0] = !boolButtonArray[0]
            AllKindTrailButton.backgroundColor = .white
        }
    }
    @IBAction func selectKButton(_ sender: UIButton) {
        KTrailButton.backgroundColor = UIColor.lightGray
        boolButtonArray[4] = true
        if boolButtonArray[0] {
            boolButtonArray[0] = !boolButtonArray[0]
            AllKindTrailButton.backgroundColor = .white
        }
    }
    @IBAction func selectOtherButton(_ sender: UIButton) {
        OtherTrailButton.backgroundColor = UIColor.lightGray
        boolButtonArray[5] = true
        if boolButtonArray[0] {
            boolButtonArray[0] = !boolButtonArray[0]
            AllKindTrailButton.backgroundColor = .lightGray
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AllKindTrailButton.backgroundColor = UIColor.lightGray
        buttonArray = [AllKindTrailButton,GDCTrailButton,ZTrailButton,TTrailButton,KTrailButton,OtherTrailButton]
        boolButtonArray = [true,false,false,false,false,false]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
