//
//  ListView.swift
//  TodoList
//
//  Created by Beyza Zengin on 18.07.2024.
//

import SwiftUI

/*
MVVM Mimarisi
Model - veri noktası
View - Kullanıcı Arayüzü
ViewModel - View için Model'leri yönetir
*/

struct ListView: View {
    
    // @EnvironmentObject: Ortak kullanılan bir ViewModel'e erişim sağlar
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        
        ZStack {
            if listViewModel.items.isEmpty {
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn)) // Geçiş animasyonu
            } else {
                List {
                    ForEach(listViewModel.items) { item in
                        ListRowView(item: item)
                            .onTapGesture { // Öğeye tıklama hareketi
                                withAnimation(.linear) { // Animasyon ile öğe güncelleme
                                    listViewModel.updateItem(item: item) // Öğeyi güncelle
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem) // Öğeyi silme işlevi
                    .onMove(perform: listViewModel.moveItem) // Öğeyi taşıma işlevi
                }
                .listStyle(PlainListStyle()) // Liste stilini düz (Plain) olarak ayarlar
            }
        }
        .navigationTitle("Todo List📝") // Sayfanın başlık kısmı
        .navigationBarItems(
            leading: EditButton(), // Sol üstte düzenleme düğmesi
            trailing:
                NavigationLink("Add", destination: AddView()) // Sağ üstte "Ekle" düğmesi, yeni öğe eklemek için
        )
    }
}

#Preview {
    NavigationView { 
        ListView()
    }
    .environmentObject(ListViewModel()) // ViewModel'i ortama ekler
}
