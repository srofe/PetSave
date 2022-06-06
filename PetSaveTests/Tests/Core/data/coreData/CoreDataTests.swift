//
//  CoreDataTests.swift
//  PetSaveTests
//
//  Created by Simon Rofe on 25/5/2022.
//

import XCTest
@testable import PetSave
import CoreData

class CoreDataTests: XCTestCase {

    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }

    func testToManagedObject() throws {
        let previewContext = PersistenceController.preview.container.viewContext
        let fetchRequest = AnimalEntity.fetchRequest()
        fetchRequest.fetchLimit = 1
        fetchRequest.sortDescriptors = [NSSortDescriptor(keyPath: \AnimalEntity.name, ascending: true)]
        guard let results = try? previewContext.fetch(fetchRequest), let first = results.first else { return }
        XCTAssert(first.name == "CHARLA", """
        Pet name did not match, was expecting CHARLA, got \(String(describing: first.name))
        """)
        XCTAssert(first.type == "Dog", """
        Pet type did not match, was expecting Dog, got \(String(describing: first.type))
        """)
        XCTAssert(first.coat.rawValue == "Short", """
        Pet coat did not match, was expecting Short, got \(String(describing: first.coat.rawValue))
        """)
    }

    func testDeleteManagedObject() throws {
        let previewContext = PersistenceController.preview.container.viewContext
        let fetchRequest = AnimalEntity.fetchRequest()
        guard let results = try? previewContext.fetch(fetchRequest), let first = results.first else { return }
        let expectedResult = results.count - 1
        previewContext.delete(first)
        guard let resultsAfterDeletion = try? previewContext.fetch(fetchRequest) else { return }
        XCTAssertEqual(expectedResult, resultsAfterDeletion.count, """
        The number of results was expected to be \(expectedResult) after deletion, was \(resultsAfterDeletion.count)
        """)
    }
}
