//
//  User.swift
//  Appetizers
//
//  Created by Reinaldo Camargo on 20/04/24.
//

import Foundation

// User <-> Data <-> UserDefault
struct User: Codable {
    var firstName = ""
    var lastName = ""
    var email = ""
    var birthdate = Date()
    var extraNapkins = false
    var frequentRefills = false
    
    
}
