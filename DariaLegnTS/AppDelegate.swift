//
//  AppDelegate.swift
//  DariaLegnTS
//
//  Created by Дарья Лень on 24.09.2020.
//  Copyright © 2020 Дарья Лень. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let config = Realm.Configuration(schemaVersion: try! schemaVersionAtURL(Realm.Configuration.defaultConfiguration.fileURL!) + 1)
        Realm.Configuration.defaultConfiguration = config
        
        return true
    }
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
    
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }
}

