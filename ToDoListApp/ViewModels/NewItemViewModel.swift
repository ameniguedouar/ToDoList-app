//
//  NewItemViewModel.swift
//  ToDoListApp
//
//  Created by Ameni Guedouar on 21.08.23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
class NewItemViewModel: ObservableObject {
    @Published var title = ""
    @Published var note = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    init() {}

    func save() {
        guard canSave else {
            return
        }
        //get currentUserId
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        // Create a Model
        let newId = UUID().uuidString
        let newItem = ToDoListItem(
            id: newId, title: title,
            dueDate: dueDate.timeIntervalSince1970,
            createDate: Date().timeIntervalSince1970,
            isDone: false
        )
        
        // Save Model
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("ToDos")
            .document(newId)
            .setData(newItem.asDictionary())
        
    }
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty
        else {
            return false
        }
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        return true
    }
}
