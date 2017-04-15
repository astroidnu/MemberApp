//
//  ScreenAController.swift
//  BelajarIos
//
//  Created by Ibnu Muzzakkir on 4/14/17.
//  Copyright © 2017 Ibnu Muzzakkir. All rights reserved.
//


import UIKit
import DLRadioButton;

class ScreenAController: UIViewController, UITextFieldDelegate,UIPickerViewDataSource, UIPickerViewDelegate{
    @available(iOS 2.0, *)
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
          return 1
    }

    @IBOutlet weak var mTxtNamaLengkap: UITextField!
    @IBOutlet weak var mTxtTanggalLahir: UITextField!
    var mNamaLengkap : String = ""
    var mTanggalLahir : Int = 0
    let pickerData = ["11", "12", "13"]
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.title = "Tambah Anggota"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // enable multiple selection for water, beer and wine buttons.
//        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ScreenAController.dismissKeyboard))
        let picker : UIPickerView
        picker = UIPickerView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        
        picker.showsSelectionIndicator = true
        picker.delegate = self
        picker.dataSource = self
        
        let toolBar = UIToolbar()
        toolBar.barStyle = UIBarStyle.default
        toolBar.isTranslucent = true
        toolBar.tintColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.plain, target: self, action: #selector(ScreenAController.closePicker(sender:)))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.plain, target: self, action: #selector(closePicker))
        
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
        toolBar.isUserInteractionEnabled = true
        
        mTxtTanggalLahir.inputView = picker
        mTxtTanggalLahir.inputAccessoryView = toolBar
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
//        tap.cancelsTouchesInView = false
//        self.mTxtTanggalLahir.delegate = self;
//        self.mTxtNamaLengkap.delegate = self;
//        view.addGestureRecognizer(tap)
        
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    private func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        mTxtTanggalLahir.text = pickerData[row]
    }

    
    
    func closePicker(sender: UIBarButtonItem) {
        print("Close picker")
        mTxtTanggalLahir.resignFirstResponder()
    }
    
    @IBAction func AddMember(_ sender: Any) {
        mNamaLengkap = mTxtNamaLengkap.text!
        
        print(mNamaLengkap  + "\(mTanggalLahir)")
    }

    func datePickerValueChanged(sender:UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyyy"
        mTxtTanggalLahir.text = dateFormatter.string(from: sender.date)
        mTanggalLahir = Int(UInt64(floor(sender.date.timeIntervalSince1970 * 1000)))
        
    }
    @IBAction func tanggalLahirAction(_ sender: UITextField) {
        print("yeaya")
        let datePickerView:UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.date
        sender.inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(ScreenAController.datePickerValueChanged(sender:)), for: .valueChanged)

    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }

    
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @objc @IBAction fileprivate func logSelectedButton(_ radioButton : DLRadioButton) {
        if (radioButton.isMultipleSelectionEnabled) {
            for button in radioButton.selectedButtons() {
                print(String(format: "%@ is selected.\n", button.titleLabel!.text!));
            }
        } else {
            print(String(format: "%@ is selected.\n", radioButton.selected()!.titleLabel!.text!));
        }
    }
    
    
}
