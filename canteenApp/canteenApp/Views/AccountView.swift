//
//  AccountView.swift
//  canteenApp
//
//  Created by Thanh Nguyen Trong on 07/09/2022.
//

import SwiftUI

struct AccountView: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [Color.green, Color.brown], startPoint:.top, endPoint: .bottom)
            ScrollView {
                VStack {
                    Image("A6MPic").resizable().scaledToFill()
                    RoundView(icon : Image("A6MProfile")).offset(y: -50)
                        .padding(.bottom, -50)
                    Text("PLACEHOLDER").font(.system(size: 25))
                    Text("PHOLS").font(.system(size: 25))
                    VStack {
                        NavigationLink {} label: {
                            TableView(title: "Designer", content: "PLANEHOLDER", unit: "")
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
