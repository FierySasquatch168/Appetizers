//
//  User.swift
//  Appetizers
//
//  Created by Aleksandr Eliseev on 21.02.2023.
//

import Foundation

struct User: Codable {
    var firstName = ""
    var lastName = ""
    var email = ""
    var birthdate = Date()
    var extraNapkins = false
    var frequestRefills = false
}
