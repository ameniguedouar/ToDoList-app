//
//  ToDoListViewModel.swift
//  ToDoListApp
//
//  Created by Ameni Guedouar on 21.08.23.
//

import Foundation
import FirebaseFirestore

class ToDoListViewModel: ObservableObject {
    

    @Published var showingNewItemView = false
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    func delete(id: String) {
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("ToDos")
            .document(id)
            .delete()
    }
    

}
