//
//  UserControllerTests.swift
//  RememberTests
//
//  Created by Olivia Moreau on 23/02/2025.
//

import XCTest

@testable import Remember

final class UserControllerTests: XCTestCase {
    var userController: UserController!

    override func setUp() {
        super.setUp()
        userController = UserController(users: [
                User(id: UUID(uuidString: "91d5f31c-fe82-4ea0-a2a5-601d1b2ac457") ?? UUID(),
                        username: "user1",
                        email: "user@email.fr",
                        capsules:[]),
                User(id: UUID(uuidString: "de9cd3ef-9705-486f-92bc-f91317c83011") ?? UUID(),
                        username: "user2",
                        email: "user@email.fr",
                        capsules:[])
            ]);
    }
    
func testCreateUser_Success() {
    do {
        let user = try userController.createUser(email: "newuser@email.fr", username: "New User")
        let userFound = userController.users.first(where: { $0.id == user.id });
        XCTAssertNotNil(userFound)
        XCTAssertEqual(userFound?.username, "New User")
        XCTAssertEqual(userFound?.email, "newuser@email.fr")
    } catch {
        XCTFail("Expected user creation to succeed, but it failed with error: \(error)")
    }
}

func testCreateUser_Failure_WrongEmail(){
    XCTAssertThrowsError(try userController.createUser(
        email: "wrongemail",
        username: "New User"
    )) { error in 
        XCTAssertEqual(error as! UserError, UserError.invalidEmail("Invalid email"))
    }
}

func testUpdateUser_Success() {
    do {
        let user = try userController.updateUser(
            id: UUID(uuidString: "91d5f31c-fe82-4ea0-a2a5-601d1b2ac457") ?? UUID(),
            username: "user_updated", email: "user_updated@example.fr"
        )
        let userFound = userController.users.first(where: { $0.id == user.id });
        XCTAssertNotNil(userFound)
        XCTAssertEqual(userFound?.username, "user_updated")
        XCTAssertEqual(userFound?.email, "user_updated@example.fr")
    } catch {
        XCTFail("Expected user update to succeed, but it failed with error: \(error)")
    }
}

func testUpdateUser_Failure_WrongEmail() {
    XCTAssertThrowsError(try userController.updateUser(
        id: UUID(uuidString: "91d5f31c-fe82-4ea0-a2a5-601d1b2ac457") ?? UUID(),
        username: "user_updated", email: "wrongemail"
    )) { error in
        XCTAssertEqual(error as! UserError, UserError.invalidEmail("Invalid email"))
    }
}
    
func testUpdateUser_Failure_NoUserFound() {
    XCTAssertThrowsError(try userController.updateUser(
        id: UUID(),
        username: "user_updated"
    )) { error in
        XCTAssertEqual(error as! UserError, UserError.userNotFound("User not found"))
    }
}

func testDeleteUser_Success() {
    do {
        let user = try userController.createUser(email: "user_to_delete@mail.fr", username: "user_to_delete")
        try userController.deleteUser(id: user.id)
        XCTAssertNil(userController.users.first(where: { $0.id == user.id }))
    } catch {
        XCTFail("Expected user deletion to succeed, but it failed with error: \(error)")
    }
}

    func testDeleteUser_Failure_NoUserFound() {
        XCTAssertThrowsError(try userController.deleteUser(id: UUID())) { error in
            XCTAssertEqual(error as! UserError, UserError.userNotFound("User not found"))
        }
        
    }

}
