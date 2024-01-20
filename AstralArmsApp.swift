//
//  AstralArmsApp.swift
//  AstralArms
//
//  Created by Testuser on 20/01/24.
//

import SwiftUI
import FirebaseCore
import FirebaseStorage
import FirebaseFirestore

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        return true
    }
    
    @main
    struct AstralArmsApp: App {
        
        @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
        
        var body: some Scene {
            WindowGroup {
                ContentView()
            }
        }
    }
}

