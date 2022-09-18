//
//  ContentView.swift
//  canteenApp
//
//  Created by Thanh Nguyen Trong on 07/09/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var authViewModel: AuthViewModel = AuthViewModel()
    
    @StateObject var centralUserManager : UserManager = UserManager(user: nil)  //First View
  
    var body: some View {
        ZStack {
            NavigationView {
                if authViewModel.signedIn {
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
                            .environmentObject(authViewModel)
                            .environmentObject(centralUserManager)
                            .tabItem {
                                Label("Account", systemImage: "bag")
                            }
                    } // end TabView
                } else {
                    SignInView()
                        .environmentObject(authViewModel)
                        .environmentObject(centralUserManager)
                }
                
            }
            .onAppear {
                authViewModel.signedIn = authViewModel.isSignedIn
            }
            SplashScreen()
        }
        
    }
}

struct yView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
