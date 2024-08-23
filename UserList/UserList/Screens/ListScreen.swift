//
//  ListScreen.swift
//  UserList
//
//  Created by Nishanth on 23/08/24.
//

import SwiftUI
import SwiftData

//MARK: User List Main Screen
struct ListScreen: View {
    
    @Query(sort: \UserData.name, order: .forward) private var userList: [UserData]
    
    @State private var addButtonClicked: Bool = false
    var body: some View {
        
        UserListScreen(userData: userList)
            .toolbar(content: {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add users") {
                        self.addButtonClicked.toggle()
                    }
                }
            })
            .sheet(isPresented: self.$addButtonClicked, content: {
                NavigationStack {
                    AddUsers()
                }
            })
        
        
    }
}


//MARK: User List screen
struct UserListScreen: View {
    let userData: [UserData]
    @Environment(\.modelContext) private var context
    var body: some View {
        List {
            ForEach(userData) { user in
                VStack(alignment: .leading, spacing: 5){
                    Text(user.name)
                        .font(.system(size: 16,weight: .bold,design: .rounded))
                    HStack(content: {
                        Text("City: \(user.city)")
                            .font(.system(size: 12, weight: .regular, design: .rounded))
                        Spacer()
                        Text("User age: \(user.age)")
                            .font(.system(size: 12, weight: .regular, design: .rounded))
                    })
                }
            }
            .onDelete(perform: { indexSet in
                indexSet.forEach { int in
                    let users = userData[int]
                    context.delete(users)
                    do{
                        try context.save()
                    }
                    catch{
                        print("error")
                    }
                }
            })
        }
    }
}



#Preview {
    ListScreen()
}
