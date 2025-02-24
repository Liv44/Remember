//
//  CapsuleControllerTests.swift
//  RememberTests
//
//  Created by Olivia Moreau on 07/02/2025.
//

import XCTest

@testable import Remember

final class CapsuleControllerTests: XCTestCase {

        var capsuleController: CapsuleController!

        override func setUp() {
            super.setUp()
            capsuleController = CapsuleController(capsules: [
                Capsule(id: UUID(uuidString: "91d5f31c-fe82-4ea0-a2a5-601d1b2ac457") ?? UUID(),
                            title: "Capsule B",
                            description: "Deuxième capsule",
                            creationDate: Date(),
                            unlockDate: Calendar.current.date(byAdding: .day, value: 20, to: Date())!,
                            medias: [],
                        location: "New York"),
                Capsule(id: UUID(uuidString: "de9cd3ef-9705-486f-92bc-f91317c83011") ?? UUID(),
                        title: "Capsule A",
                        description: "Première capsule",
                        creationDate: Date(),
                        unlockDate: Calendar.current.date(byAdding: .day, value: 10, to: Date())!,
                        medias: [],
                        location: "Paris"),
            ]);
        }
    
    func testCreateCapsule_Success() {
        let futureDate = Calendar.current.date(byAdding: .day, value: 1, to: Date())!
        do {
            let capsule = try capsuleController.createCapsule(
                title: "Test Capsule",
                description: "Une capsule de test",
                unlockDate: futureDate,
                medias: [],
                location: "Paris"
            )
            
            let capsuleFound = capsuleController.capsules.first(where: { $0.id == capsule.id });
            
            XCTAssertNotNil(capsuleFound)
            XCTAssertEqual(capsuleFound?.title, "Test Capsule")
            XCTAssertEqual(capsuleFound?.description, "Une capsule de test")
            XCTAssertEqual(capsuleFound?.location, "Paris")
        } catch {
            XCTFail("Expected capsule creation to succeed, but it failed with error: \(error)")
        }
    }

        override func tearDown() {
            capsuleController = nil
            super.tearDown()
        }
    
    func testCreateCapsule_Failure_PastUnlockDate() {
        let pastDate = Calendar.current.date(byAdding: .day, value: -1, to: Date())!
        
        XCTAssertThrowsError(try capsuleController.createCapsule(
            title: "Ancienne Capsule",
            description: "Une capsule expirée",
            unlockDate: pastDate,
            medias: [],
            location: "Paris"
        )) { error in
            XCTAssertEqual(error as? CapsuleError, CapsuleError.invalidDate("unlock Date must be after creation Date"))
        }
    }
    
    func testUpdateCapsule_Success() {
        do {
            let unlockDate = Calendar.current.date(byAdding: .day, value: 30, to: Date())!;
            _ = try capsuleController.updateCapsule(id: UUID(uuidString: "91d5f31c-fe82-4ea0-a2a5-601d1b2ac457") ?? UUID(),
                title: "Updated Capsule",
                description: "updated description",
                unlockDate: unlockDate,
                medias: [],
                location: "Nantes"
            )
            
            let updatedCapsule = try capsuleController.getCapsuleById(id: UUID(uuidString: "91d5f31c-fe82-4ea0-a2a5-601d1b2ac457") ?? UUID())
            
            XCTAssertNotNil(updatedCapsule)
            XCTAssertEqual(updatedCapsule.title, "Updated Capsule")
            XCTAssertEqual(updatedCapsule.description, "updated description")
            XCTAssertEqual(updatedCapsule.location, "Nantes")
        } catch {
            XCTFail("Expected capsule updated to succeed, but it failed with error: \(error)")
        }
    }
    
    func testUpdateCapsule_Failure_PastUnlockDate() {
        let pastDate = Calendar.current.date(byAdding: .day, value: -1, to: Date())!
        
        XCTAssertThrowsError(try capsuleController.updateCapsule(id: UUID(uuidString: "91d5f31c-fe82-4ea0-a2a5-601d1b2ac457") ?? UUID(),
            unlockDate: pastDate
        )) { error in
            XCTAssertEqual(error as? CapsuleError, CapsuleError.invalidDate("unlock Date must be after updated Date"))
        }
    }
    
    func testUpdateCapsule_Failure_NoCapsuleFound() {
        XCTAssertThrowsError(try capsuleController.updateCapsule(id: UUID(), title: "wrong capsule"
        )) { error in
            XCTAssertEqual(error as? CapsuleError, CapsuleError.capsuleNotFound("Capsule not found"))
        }
    }
    
    func testDeleteCapsule_Success() {
        do {
            let unlockDate = Calendar.current.date(byAdding: .day, value: 30, to: Date())!;
            let capsule = try capsuleController.createCapsule(title: "Capsule to delete", description: "description", unlockDate: unlockDate, medias: [], location: "location");
            
            try capsuleController.deleteCapsule(id: capsule.id);
            
            XCTAssertNil(capsuleController.capsules.first(where: { $0.id == capsule.id }));
            
        } catch {
            XCTFail("Expected capsule deleted to succeed, but it failed with error: \(error)")
        }
    }
    
    func testDeleteCapsule_Failure_NoCapsuleFound() {
        XCTAssertThrowsError(try capsuleController.updateCapsule(id: UUID()
        )) { error in
            XCTAssertEqual(error as? CapsuleError, CapsuleError.capsuleNotFound("Capsule not found"))
        }
    }
}
