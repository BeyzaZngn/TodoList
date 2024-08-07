//
//  TodoListApp.swift
//  TodoList
//
//  Created by Beyza Zengin on 17.07.2024.
//

import SwiftUI

@main
struct TodoListApp: App {
    
    @StateObject var listViewModel : ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            
            NavigationView { // Uygulamamızı her zaman bir gezinme görünümüne almak için ListView() i bir NavigationView içine aldık.
                ListView()
            }
            .environmentObject(listViewModel)
          
        }
    }
}
