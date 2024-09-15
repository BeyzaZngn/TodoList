//
//  ListRowView.swift
//  TodoList
//
//  Created by Beyza Zengin on 19.07.2024.
//

import SwiftUI

struct ListRowView: View {
    
    // Her bir liste öğesi için model
    let item: ItemModel
    
    var body: some View {
        
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red) // Tamamlandıysa yeşil, değilse kırmızı
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}


#Preview("This is the first title") { // İlk önizleme için
    // Öğe tamamlanmamış olarak önizleme
    ListRowView(item: ItemModel(title: "This is the first item", isCompleted: false))
}

#Preview("This is the second title") { // İkinci önizleme için
    // Öğe tamamlanmış olarak önizleme
    ListRowView(item: ItemModel(title: "This is the second item", isCompleted: true))
}
