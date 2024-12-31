//
//  Item.swift
//  UserList
//
//  Created by Nishanth on 23/08/24.
//

import Foundation
import SwiftData

@Model
final class UserData{
    @Attribute(.unique) var name: String
    var age: Int
    var city: String
    
    init(name: String, age: Int, city: String) {
        self.name = name
        self.age = age
        self.city = city
    }
}
