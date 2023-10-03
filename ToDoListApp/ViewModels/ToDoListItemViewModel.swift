//
//  ToDoListItemViewModel.swift
//  ToDoListApp
//
//  Created by Ameni Guedouar on 21.08.23.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore
import SwiftUI

// ViewModel for single to do list item view

class ToDoListItemViewModel: ObservableObject {
    init(){
        
    }
    
    func toggleIsDone(item: ToDoListItem) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        


        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("ToDos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())

    }


}

