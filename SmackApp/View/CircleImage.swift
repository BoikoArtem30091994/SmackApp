//
//  CircleImage.swift
//  SmackApp
//
//  Created by Boiko Artem on 13.10.17.
//  Copyright © 2017 Boiko Artem. All rights reserved.
//

import UIKit

class CircleImage: UIImageView {
    override func awakeFromNib() {
        setUpView()
    }
    
    func setUpView() {
       self.layer.cornerRadius = self.frame.width / 2
       self.clipsToBounds = true
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setUpView()
    }
}
