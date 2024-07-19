//
//  ItemModel.swift
//  TodoList
//
//  Created by Beyza Zengin on 19.07.2024.
//

import Foundation

struct ItemModel: Identifiable {
    
    let id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
    
}
