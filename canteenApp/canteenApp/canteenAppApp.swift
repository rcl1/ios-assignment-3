//
//  canteenAppApp.swift
//  canteenApp
//
//  Created by Thanh Nguyen Trong on 07/09/2022.
//

import SwiftUI
import Firebase
import FirebaseFirestore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        print("SUCCESS: Connected")
        return true
    }
}

@main
struct cantennAppApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate //delegate

    @StateObject var itemViewModel = ItemViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(itemViewModel)
        }
    }
}
