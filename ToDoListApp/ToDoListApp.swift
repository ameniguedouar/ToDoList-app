//
//  ToDoListAppApp.swift
//  ToDoListApp
//
//  Created by Ameni Guedouar on 16.08.23.
//


import FirebaseCore
import SwiftUI

@main
struct ToDoListApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
