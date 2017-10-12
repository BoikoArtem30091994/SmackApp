//
//  CreateAccountVC.swift
//  SmackApp
//
//  Created by Boiko Artem on 08.10.17.
//  Copyright © 2017 Boiko Artem. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet weak var userNameTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passTxt: UITextField!
    @IBOutlet weak var userImage: UIImageView!
    
    // MARK: Variables
    var avatarName = "profileDefault"
    var avatarColor = "[0.5, 0.5, 0.5, 1]"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: Actions
    @IBAction func closePressed(_ sender: Any) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    @IBAction func createAccntPressed(_ sender: Any) {
        guard let name = userNameTxt.text, userNameTxt.text != "" else {return}
        guard let email = emailTxt.text, emailTxt.text != "" else {return}
        guard let pass = passTxt.text, passTxt.text != "" else {return}
        
        AuthServices.instance.registerUser(email: email, password: pass) { (success) in
            if success {
                AuthServices.instance.loginUser(email: email, password: pass, completion: { (success) in
                    if success {
                        AuthServices.instance.createUser(name: name, email: email, avatarName: self.avatarName, avatarColor: self.avatarColor, completion: { (success) in
                            if success {
                                print(UserDataService.instance.name, UserDataService.instance.avatarName)
                                self.performSegue(withIdentifier: UNWIND, sender: nil)
                            }
                        })
                    }
                })
            }
        }
    }
    
    
    
    @IBAction func pickAvatarPressed(_ sender: Any) {
        
    }
    @IBAction func pickBGColorPressed(_ sender: Any) {
    }

}
