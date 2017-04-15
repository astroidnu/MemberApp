//
//  ViewController.swift
//  BelajarIos
//
//  Created by Ibnu Muzzakkir on 4/13/17.
//  Copyright © 2017 Ibnu Muzzakkir. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnHitMe: UIButton!
    @IBOutlet weak var btnScreenB: UIButton!
    
    var mEdText : String = ""
  
    @IBAction func ScreenB(_ sender: UIButton) {
        performSegue(withIdentifier: "ScreenB", sender: self)
    }
       
    @IBAction func HitMe(_ sender: UIButton) {
        performSegue(withIdentifier: "ScreenA", sender: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.title = "Main Screen"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let backItem = UIBarButtonItem()
        backItem.title = "Back"
        navigationItem.backBarButtonItem = backItem // This will show in the next view controller being pushed
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

