//
//  ProfileViewModel.swift
//  ToDoListApp
//
//  Created by Ameni Guedouar on 21.08.23.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class ProfileViewModel: ObservableObject {
    init(){}
    
    @Published var user: User? = nil
    func fetchUser() {
        guard let userId = Auth.auth().currentUser?.uid else {
            return
            
        }
        let db = Firestore.firestore()
        db.collection("users").document(userId).getDocument {[weak self] Snapshot, error in
            guard let data = Snapshot?.data(), error == nil  else {
                return
            }
            DispatchQueue.main.async {
                self?.user = User(id: data["id"] as? String ?? "",
                                  name:  data["name"] as? String ?? "",
                                  email:  data["email"] as? String ?? "",
                                  joined:  data["joined"] as? TimeInterval ?? 0)
            }
        }
    }
    
    
    
    func logOut() {
        do {
            try Auth.auth().signOut()
        }
        catch {
            print(error)
        }
    }
}
