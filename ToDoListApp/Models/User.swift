//
//  User.swift
//  ToDoListApp
//
//  Created by Ameni Guedouar on 16.08.23.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
