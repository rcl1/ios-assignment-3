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
import FirebaseFirestore

class UserManager: ObservableObject {
    @Published var user: UserData?
    
    //Insert into Views
    //CODE: @StateObject var centralUserManager : UserManager = UserManager(user: nil)  //First View
    //CODE: @EnvironmentObject var centralUserManager : UserManager                     //Other Views
    //Insert into on Login success
    //CODE: centralUserManager.setActiveUser(email: email)
    //Insert into Sign Up success
    //CODE: centralUserManager.addNewUser(name: name, email: email)
    //To pass item other view
    //CODE: <VIEW>.environmentObject(centralUserManager)
    //Insert into text for username
    //CODE: /(centralUserManager.user?.name ?? "NamelessOne")
    // For Preview
    //CODE:xxxView().environmentObject(UserManager(user: UserData(userName: "Plaza HOLden", email: "text")))
    
    
    private var userDB = Firestore.firestore()
    
    init(user : UserData?) {
        self.user = user
    }
    
    //Set the current user by loading the data into the user manager
    //Take in the login name, query into a seperate user list database
    //Order history is stored simply as a list of order id which is query seperately to generate the order list
    func setActiveUser(email: String,  completion: @escaping () -> Void) {
        var userName = "Empty"
        var balance = 0
        var orderHist: Array<String> = []
        //var email = "c@test.com"
        userDB.collection("users").whereField("email", isEqualTo: email).getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                    userName = (document.get("name") as? String)!
                    balance = (document.get("balance") as? Int)!
                    orderHist = (document.get("order") as? Array<String>)!
                    self.user = UserData(userName: userName, email: email, balance: balance, orderHist: orderHist, id: document.documentID)
                    completion()
                }
            }
        }
        
    }
    
    func addOrder(cost: Int, orderID: String) {
        self.user?.walletBalance -= cost
        self.user?.orderHistory.append(orderID)
        print(self.user!.id)
        userDB.collection("users").document(self.user!.id).updateData([
            "balance" : self.user?.walletBalance,
            "order" : self.user?.orderHistory
        ])
    }
    
    func removeOrder(cost: Int, orderID: String) {
        self.user?.walletBalance += cost
        //var newList = self.user?.orderHistory.filter {$0 != orderID}
        self.user?.orderHistory = self.user?.orderHistory.filter {$0 != orderID} ?? []
        print(self.user!.id)
        userDB.collection("users").document(self.user!.id).updateData([
            "balance" : self.user?.walletBalance,
            "order" : self.user?.orderHistory
        ])
    }
    
    func deleteOrder() {
        
    }
    
    func addNewUser(name: String, email: String) {
        userDB.collection("users").addDocument(data: ["name" : name, "email" : email, "balance" : 0, "orderHistory" : [] ])
    }
    
    
}

