//
//  UserListApp.swift
//  UserList
//
//  Created by Nishanth on 23/08/24.
//

import SwiftUI
import SwiftData

@main
struct UserListApp: App {
    

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: [UserData.self])
    }
}
