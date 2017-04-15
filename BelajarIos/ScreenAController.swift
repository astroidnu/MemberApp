//
//  ScreenAController.swift
//  BelajarIos
//
//  Created by Ibnu Muzzakkir on 4/14/17.
//  Copyright © 2017 Ibnu Muzzakkir. All rights reserved.
//


import UIKit
import DLRadioButton;
class ScreenAController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var mTxtNamaLengkap: UITextField!
    @IBOutlet weak var mTxtTanggalLahir: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.title = "Tambah Anggota"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // enable multiple selection for water, beer and wine buttons.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ScreenAController.dismissKeyboard))
        
        //Uncomment the line below if you want the tap not not interfere and cancel other interactions.
        //tap.cancelsTouchesInView = false
        self.mTxtTanggalLahir.delegate = self;
        self.mTxtNamaLengkap.delegate = self;
        view.addGestureRecognizer(tap)
        
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
