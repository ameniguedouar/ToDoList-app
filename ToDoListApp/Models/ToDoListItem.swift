//
//  ToDoListItem.swift
//  ToDoListApp
//
//  Created by Ameni Guedouar on 16.08.23.
//

import Foundation
import SwiftUI
import UIKit

struct ToDoListItem: Codable, Identifiable {
    let id: String
    var title: String
    let dueDate: TimeInterval
    let createDate: TimeInterval
    var isDone: Bool

    

    mutating func setDone(_ state: Bool){

        isDone = state
        
    }
    
    }
