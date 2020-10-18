//
//  User.swift
//  MDBSocials
//
//  Created by Abhishek Kattuparambil on 10/17/20.
//

import UIKit

class User{
    var username: String! = ""
    var email: String! = ""
    var uid: String! =  ""
    
    init(forUser username: String, withEmail email: String, withUID uid: String) {
        self.username = username
        self.email = email
        self.uid = uid
    }

}
