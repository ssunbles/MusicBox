//
//  UserDefault.swift
//  MusicBox
//
//  Created by Айнур on 13.09.2023.
//

import Foundation

class User  {
    var login : String
    var email : String
    var password : String
    
    init(login: String, email: String, password: String) {
        self.login = login
        self.email = email
        self.password = password
    }
}


