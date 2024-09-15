//
//  ListViewModel.swift
//  TodoList
//
//  Created by Beyza Zengin on 29.07.2024.
//

import Foundation

/*
 
 CRUD FUNCTIONS
 
 Create
 Read
 Update
 Delete

*/


class ListViewModel: ObservableObject {
    
    // Liste öğelerini yayınlayarak (publish) değişiklikleri gözlemlenebilir hale getirir
    @Published var items: [ItemModel] = [] {
        didSet {
            saveItems()
        }
    }
    
    let itemsKey: String = "items_list"
    
    init() {
        getItems() // Uygulama başlatıldığında öğeleri alır
    }
    
    // UserDefaults'tan kaydedilmiş öğeleri almak için fonksiyon
    func getItems() {
        // Kullanıcı varsayılanlarından veriyi alır ve JSON'dan çözmeye çalışır
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else { return }
        
        self.items = savedItems // Çözülen öğeleri listeye atar
    }
    
    // Belirtilen indekslerden öğeleri silmek için fonksiyon
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    // Öğeleri listede hareket ettirmek için fonksiyon
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    // Yeni bir öğe eklemek için fonksiyon
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false) // Yeni öğeyi oluşturur
        items.append(newItem) // Yeni öğeyi listeye ekler
    }
    
    // Var olan bir öğeyi güncellemek için fonksiyon
    func updateItem(item: ItemModel) {
        // Güncellenecek öğeyi listede arar
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateCompletion() // Öğenin tamamlanma durumunu günceller
        }
    }
    
    // Öğeleri UserDefaults'a kaydetmek için fonksiyon
    func saveItems() {
        // Öğeleri JSON'a kodlar ve kullanıcı varsayılanlarına kaydeder
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: "items_list")
        }
    }
}
