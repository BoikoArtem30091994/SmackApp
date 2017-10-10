//
//  Constants.swift
//  SmackApp
//
//  Created by Boiko Artem on 06.10.17.
//  Copyright © 2017 Boiko Artem. All rights reserved.
//

import Foundation

typealias CompletionHandler = (_ Success: Bool) -> ()

//Url Constants
let BASE_URL =  "https://smackyapp.herokuapp.com/v1/"
let URL_REGISTER = "\(BASE_URL)account/register"


//Segues
let TO_LOGIN = "toLogin"
let TO_CREATE_ACCOUNT = "toCreateAccount"
let UNWIND = "unwindToChannel"

//Services Constants
let TOKEN_KEY = "token"
let LOGGED_IN_KEY = "loggedIn"
let USER_EMAIL = "userEmail"
