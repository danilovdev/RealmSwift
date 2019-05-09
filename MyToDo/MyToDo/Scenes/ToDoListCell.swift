//
//  ToDoListCell.swift
//  MyToDo
//
//  Created by Alexey Danilov on 5/6/19.
//  Copyright © 2019 DanilovDev. All rights reserved.
//

import UIKit

class ToDoListCell: UITableViewCell {
    
    private var onToggleCompleted: ((ToDoItem) -> Void)?
    
    private var item: ToDoItem?
    
    @IBOutlet private var label: UILabel!
    
    @IBOutlet private var button: UIButton!
    
    @IBAction private func toggleCompleted() {
        guard let item = item else { fatalError("Missing Todo Item") }
        
        onToggleCompleted?(item)
    }
    
    func configureWith(_ item: ToDoItem, onToggleCompleted: ((ToDoItem) -> Void)? = nil) {
        self.item = item
        self.onToggleCompleted = onToggleCompleted
        
        label.attributedText = NSAttributedString(string: item.text,
                                                  attributes: item.isCompleted ? [.strikethroughStyle: true] : [:])
        button.setTitle(item.isCompleted ? "☑️": "⏺", for: .normal)
    }
}
