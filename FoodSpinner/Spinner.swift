//
//  Spinner.swift
//  FoodSpinner
//
//  Created by Juan-Alejandro Bondad 2019 on 5/7/19.
//  Copyright © 2019 Juan-Alejandro Bondad 2019. All rights reserved.
//

import UIKit

class Spinner: UIViewController {
    var userDefaults = UserDefaults.standard
    @IBOutlet weak var lbl_choice: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var savedOptions = userDefaults.array(forKey: "savedOptions")
    }
    
}
