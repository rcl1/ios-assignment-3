/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2022B
  Assessment: Assignment 3
  Author: Do Ha Minh Long
  ID: s3634734
  Created  date: 13/09/2022
  Last modified: 1X/09/2022
  Acknowledgement:
*/

import Foundation

struct UserData {
    var id: String
    var name : String
    var email : String
    var icon : String
    var walletBalance: Int
    var orderHistory : Array<String> = []
    init(userName: String, email: String, balance: Int, orderHist: Array<String>, id: String) {
        self.name = userName
        self.email = email
        self.walletBalance = balance
        self.orderHistory = orderHist
        self.id = id
        icon = "A6MProfile"
    }
}
