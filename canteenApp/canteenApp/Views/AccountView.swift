//
//  AccountView.swift
//  canteenApp
//
//  Created by Thanh Nguyen Trong on 07/09/2022.
//

import SwiftUI

struct AccountView: View {
    @State var userName = ""
    @State var loginID = "b@test.com" // Replace with appropriate id in after Login View is finish
    
    //User data controller object, REPLACE WITH ENVIROMENT OBJECT AFTER OTHER VIEWS ARE COMPLETED
    @StateObject var centralUserManager : UserManager = UserManager(user: nil)

    // COLOR FOR BACKGROUND
    let color1 = Color(hue: 0.0858, saturation: 0.42, brightness: 0.93)
    let color2 = Color(hue: 0.8554, saturation: 0.72, brightness: 0.82)
    
    var body: some View {
        ZStack {
            //Background Layer
            LinearGradient(gradient: Gradient(colors:[color2,color1]), startPoint:.bottomLeading, endPoint: .topTrailing)
                .onAppear(){ // For pulling user data from Firebase
                    print("DEBUG: pull user data")
                    centralUserManager.setActiveUser(email: loginID) {
                        userName = centralUserManager.user?.name ?? "NamelessONE"
                    }
                }
            ScrollView {
                VStack {
                    //Profile picture, change base on user name, can't be replace with user upload picture
                    RoundViewDynamic(name: $userName).offset(y: -50)
                        .padding(.top, 70).padding(.bottom, -50)
                    //Username, dynamic
                    Text(userName).font(.system(size: 25))
                    VStack {
                        NavigationLink {} label: {
                            //Dynamically show account balance
                            TableView(title: "Account Balance",
                                      content: String(centralUserManager.user?.walletBalance ?? 0)
                            )
                        }
                    }
                }
                 /* DEBUG Buttons to test dynamic display
                Button {
                    centralUserManager.addOrder(cost: 100, orderID: "GACHAAA")
                } label: {
                Text("MONEY GO BRRR!")
                }
                  Button {
                      centralUserManager.removeOrder(cost: 100, orderID: "GACHAAA")
                  } label: {
                  Text("F2P FTW")
                  }
                Button {
                    centralUserManager.setActiveUser(email: "c@test.com"){
                        userName = centralUserManager.user?.name ?? "NamelessOne"
                    }
                } label: {
                Text("SWITCH!!")
                }
                 
                 */
            }
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
