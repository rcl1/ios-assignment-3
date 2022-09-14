//
//  AccountView.swift
//  canteenApp
//
//  Created by Thanh Nguyen Trong on 07/09/2022.
//

import SwiftUI

struct AccountView: View {
    @State var userProfile = "A6MProfile"
    @State var userName = "NamelessONE"
    
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color.green, Color.brown], startPoint:.top, endPoint: .bottom)
            ScrollView {
                VStack {
                    RoundView(icon : Image(userProfile)).offset(y: -50)
                        .padding(.top, 70).padding(.bottom, -50)
                    Text(userName).font(.system(size: 25))
                    VStack {
                        NavigationLink {} label: {
                            TableView(title: "Designer", content: "PLANEHOLDER")
                        }
                    }
                }
            }
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
