//
//  CapsuleController.swift
//  Remember
//
//  Created by Louis Teilliais on 17/01/2025.
//

import Foundation

enum UserError: Error, Equatable {
    case userNotFound(String)
    case invalidEmail(String)
}


class UserController : ObservableObject {
    @Published var users: [User]
    
    init(users: [User]) {
        self.users = users
    }
    
    // Create user
    func createUser(
        email: String,
        username:String
    ) throws -> User {
        
        guard isValidEmail(email) else {
            throw UserError.invalidEmail("Invalid email")
        }
        
        let newUser = User(
            id: UUID(),
            username: username,
            email: email,
            capsules: []
        )
        
        users.append(newUser)

        print("Users was added successfully")
        return newUser
    }
    
    // Get user
    func getUser(id: UUID) throws -> User {
        guard let user = users.first(where: { $0.id == id }) else {
            throw UserError.userNotFound("User not found")
        }
        return user
    }
    
    
    // Update user
    func updateUser(id: UUID, username: String? = nil, email: String? = nil) throws -> User {
        
        var userToUpdate = try getUser(id: id)
        
        if let email = email {
            guard isValidEmail(email) else {
                throw UserError.invalidEmail("Invalid email")
            }
            userToUpdate.email = email
        }
        
        if let username = username {
            userToUpdate.username = username
        }
        
        if let i = users.firstIndex(where: { $0.id == id }) {
            users[i] = userToUpdate
        }
        
        return userToUpdate
    }
    
    // Delete User
    func deleteUser(id: UUID) throws {
        if let i = users.firstIndex(where: { $0.id == id }) {
            users.remove(at: i)
        } else {
            throw UserError.userNotFound("User not found")
        }
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}
