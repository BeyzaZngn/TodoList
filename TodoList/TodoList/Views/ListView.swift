//
//  ListView.swift
//  TodoList
//
//  Created by Beyza Zengin on 18.07.2024.
//

import SwiftUI

/*
MVVM Architecture
Model - data point
View - UI
ViewModel - manages Models for View
*/

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        
        List {
            ForEach(listViewModel.items) { item in
                ListRowView(item: item)
            }
            .onDelete(perform: listViewModel.deleteItem)
            .onMove(perform: listViewModel.moveItem)
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Todo List📝")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                NavigationLink("Add", destination: AddView())
            )
    }
    
}

#Preview {
    NavigationView{ // !!!
        ListView()
    }
    .environmentObject(ListViewModel())
}
