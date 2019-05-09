//
//  ToDoItem.swift
//  MyToDo
//
//  Created by Alexey Danilov on 5/6/19.
//  Copyright © 2019 DanilovDev. All rights reserved.
//

import Foundation
import RealmSwift

@objcMembers class ToDoItem: Object {
    
    enum Property: String {
        
        case id
        
        case text
        
        case isCompleted
    }
    
    dynamic var id = UUID().uuidString
    
    dynamic var text = ""
    
    dynamic var isCompleted = false
    
    override static func primaryKey() -> String? {
        return ToDoItem.Property.id.rawValue
    }
    
    convenience init(_ text: String) {
        self.init()
        self.text = text
    }
}

// MARK: - CRUD methods
extension ToDoItem {
    
    static func all(in realm: Realm = try! Realm()) -> Results<ToDoItem> {
        return realm.objects(ToDoItem.self)
            .sorted(byKeyPath: ToDoItem.Property.isCompleted.rawValue)
    }
    
    @discardableResult
    static func add(text: String, in realm: Realm = try! Realm()) -> ToDoItem {
        let item = ToDoItem(text)
        try! realm.write {
            realm.add(item)
        }
        return item
    }
    
    func toggleCompleted() {
        guard let realm = realm else { return }
        try! realm.write {
            isCompleted = !isCompleted
        }
    }
    
    func delete() {
        guard let realm = realm else { return }
        try! realm.write {
            realm.delete(self)
        }
    }
    
    func updateText(_ newText: String) {
        guard let realm = realm else { return }
        try! realm.write {
            text = newText
        }
    }
}
