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
    
    @State var items: [ItemModel] = [
        
        ItemModel(title: "This is the first title!", isCompleted: false),
        ItemModel(title: "This is the second!", isCompleted: true),
        ItemModel(title: "Third!", isCompleted: false)
        
    ]
    
    var body: some View {
        
        List {
            ForEach(items) { item in
                ListRowView(item: item)
            }
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
}
