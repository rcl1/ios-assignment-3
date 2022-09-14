//
//  UserData.swift
//  myApp2 (iOS)
//
//  Created by Long, Do Ha Minh on 14/09/2022.
//

import Foundation

struct UserData {
    var name : String
    var email : String
    var icon : String
    var walletBalance: Int
    var orderHistory : [Order] = []
    init(userName: String, email: String, balance: Int) {
        self.name = userName
        self.email = email
        self.walletBalance = balance
        icon = "A6MProfile"
    }
}
