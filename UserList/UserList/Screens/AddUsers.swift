//
//  AddUsers.swift
//  UserList
//
//  Created by Nishanth on 23/08/24.
//

import SwiftUI
import SwiftData

struct AddUsers: View {
    
    @State private var username: String = ""
    @State private var age: String = ""
    @State private var city: String = ""
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    
    
    
    
    var body: some View {
        Form {
            TextField("User name", text: $username)
            TextField("Age", text: $age)
            TextField("City", text: $city)
        }
        
        .navigationTitle("Add Users")
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: {
                    dismiss()
                }, label: {
                    Text("Back")
                })
            }
            
            ToolbarItem(placement: .bottomBar) {
                Button(action: {
                    
                    self.saveuserdata()
                    
                }, label: {
                    Text("Save")
                })
            }
        }
    }
    
    
    
    private func saveuserdata(){
        guard let ageNumber = Int(age) else{return}
        let userData = UserData(name: username, age: ageNumber, city: city)
        context.insert(userData)
        do{
            try context.save()
        }
        catch{
            print("error")
        }
        dismiss()

    }
    
}

#Preview {
    NavigationStack {
        AddUsers()
            .modelContainer(for: [UserData.self])
    }
}


extension String{
    
    var whiteSpaceRemove:Bool{
        self.trimmingCharacters(in: .whitespaces).isEmpty
    }
}
