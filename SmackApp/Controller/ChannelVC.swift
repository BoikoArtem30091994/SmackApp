//
//  ChannelVC.swift
//  SmackApp
//
//  Created by Boiko Artem on 06.10.17.
//  Copyright © 2017 Boiko Artem. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
    }
}
