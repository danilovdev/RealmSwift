//
//  AppDelegate.swift
//  MyToDo
//
//  Created by Alexey Danilov on 5/6/19.
//  Copyright © 2019 DanilovDev. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        initializeRealm()
        
        return true
    }
    
    private func initializeRealm() {
        let realm = try! Realm()
        guard realm.isEmpty else { return }
        
        try! realm.write {
            realm.add(ToDoItem("buy Milk"))
            realm.add(ToDoItem("Finish Book"))
        }
    }
}

