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
    
    @State var items: [String] = ["This is the first title!", "This is the second title!", "This is the third title!"]
    
    var body: some View {
        
        List {
            ForEach(items, id: \.self) { item in
                ListRowView(title: item)
            }
        }
        .navigationTitle("Todo List📝")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                NavigationLink("Add", destination: Text("Destination"))
            )
    }
}

#Preview {
    NavigationView{ // !!!
        ListView()
    }
}
