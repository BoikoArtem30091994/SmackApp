//
//  CreateAccountVC.swift
//  SmackApp
//
//  Created by Boiko Artem on 08.10.17.
//  Copyright © 2017 Boiko Artem. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func closePressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
}
