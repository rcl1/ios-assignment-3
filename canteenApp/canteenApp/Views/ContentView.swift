//
//  ContentView.swift
//  canteenApp
//
//  Created by Thanh Nguyen Trong on 07/09/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            FoodListView()
                .tabItem{
                    Label("Menu", systemImage: "list.dash")
                }
            OrdersListView()
                .tabItem{
                    Label("Orders", systemImage: "bag")
                }
            AccountView()
                .tabItem {
                    Label("Account", systemImage: "bag")
                }
        } // end TabView
    }
}
