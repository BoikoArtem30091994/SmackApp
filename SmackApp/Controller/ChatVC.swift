//
//  ChatVC.swift
//  SmackApp
//
//  Created by Boiko Artem on 06.10.17.
//  Copyright © 2017 Boiko Artem. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {

   // Outlets
    @IBOutlet weak var menuBtn: UIButton!
    @IBOutlet weak var channelNameLbl: UILabel!
    @IBOutlet weak var messageTxtBox: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.bindToKeyboard()
        let tap = UIGestureRecognizer(target: self, action: #selector (ChatVC.closeTap))
//        view.addGestureRecognizer(tap)
        menuBtn.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        
        NotificationCenter.default.addObserver(self, selector: #selector(ChatVC.userDataDidChange(_:)), name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ChatVC.channelSelected(_:)), name: NOTIF_CHANNEL_SELECTED, object: nil)
        
        if AuthServices.instance.isLogged{
            AuthServices.instance.findUserByEmail(completion: { (success) in
                NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
            })
        }
    }
    
    @objc func userDataDidChange(_ notif: Notification) {
        if AuthServices.instance.isLogged {
            // get channels
            onLogginGetMessages()
        } else {
            let string = "Please Log In"
            channelNameLbl.text = string
        }
    }
    
    @objc func channelSelected(_ notif: Notification) {
        updateWithChannels()
    }
    
    @objc func closeTap(){
        view.endEditing(true)
    }
    
    @IBAction func sendMsgPressed(_ sender: Any) {
        if AuthServices.instance.isLogged{
            guard let channelId = MessageService.instance.selectedChannels?.id else {return}
            guard let message = messageTxtBox.text else {return}
            
            SocketService.instance.addMessage(messageBody: message, userId: UserDataService.instance.id, channelId: channelId, completion: { (success) in
                if success {
                    self.messageTxtBox.text = ""
                    self.messageTxtBox.resignFirstResponder()
                }
            })
        }
    }
    
    func updateWithChannels(){
        let channelName = MessageService.instance.selectedChannels?.channelTitle ?? ""
        channelNameLbl.text = "#\(channelName)"
        getMessages()
    }
    
    func onLogginGetMessages(){
        MessageService.instance.findAllChannels { (success) in
            if success {
                if MessageService.instance.channels.count > 0 {
                    MessageService.instance.selectedChannels = MessageService.instance.channels[0]
                    self.updateWithChannels()
                } else {
                    self.channelNameLbl.text = "No channels!"
                }
            }
        }
    }
    
    func getMessages(){
        guard let channelId = MessageService.instance.selectedChannels?.id else {return}
        MessageService.instance.findAllMessagesForChannel(channelId: channelId) { (success) in
            
        }
    }
    
    
    
    
    
    
    
    
}
