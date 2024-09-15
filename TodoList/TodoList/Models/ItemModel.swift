//
//  ItemModel.swift
//  TodoList
//
//  Created by Beyza Zengin on 19.07.2024.
//

import Foundation

// Immutable Struct
struct ItemModel: Identifiable, Codable {
    // Her bir öğe için gerekli özellikler
    let id: String
    let title: String
    let isCompleted: Bool
    
    // Başlatıcı (Initializer) fonksiyon
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = UUID().uuidString // Benzersiz bir kimlik oluşturur
        self.title = title
        self.isCompleted = isCompleted // Tamamlanma durumunu atar
    }
    
    // Tamamlanma durumunu güncelleyen fonksiyon
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)  // Mevcut öğenin tamamlanma durumunu tersine çevirir ve yeni bir öğe oluşturur
    }
    
}

