//
//  ContentView.swift
//  TodoList
//
//  Created by Beyza Zengin on 17.07.2024.
//

import SwiftUI

/*
MVVM Architecture
Model - data point
View - UI
ViewModel - manages Models for View
*/

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
