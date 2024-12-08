//
//  Excercise.swift
//  Final Project Group 21
//
//  Created by MAD2 on 11/28/24.
//

import Foundation
import FirebaseFirestore

struct Exercise: Codable {
    //@DocumentID var id: String?
    var name: String
    var sets: Int
    var reps: Int
    var rest: Int
    
    init(name: String, sets: Int, reps: Int, rest: Int) {
        self.name = name
        self.sets = sets
        self.reps = reps
        self.rest = rest
    }
    
}
