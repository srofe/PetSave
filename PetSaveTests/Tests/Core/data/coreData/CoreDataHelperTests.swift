//
//  CoreDataHelperTests.swift
//  PetSaveTests
//
//  Created by Simon Rofe on 16/6/2022.
//

import XCTest
@testable import PetSave

class CoreDataHelperTests: XCTestCase {

    override func setUpWithError() throws {
        try super.setUpWithError()
        CoreDataHelper.clearDatabase()
        print("documents \(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0])")
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }

//    func testPersistableField() throws {
//        // Given
//        let mockedAnimal = Animal.mock[1]
//        let context = PersistenceController.shared.container.viewContext
//        CoreDataHelper.clearDatabase()
////        @Persistable<Animal, AnimalEntity>(context: context) var pet: Animal?
////        pet = mockedAnimal
//        @Persistable<Breed, BreedEntity>(context: context) var breed: Breed?
//        breed = mockedAnimal.breeds
//
//        // When
//        let fetchRequest = BreedEntity.fetchRequest()
//        if let results = try? context.fetch(fetchRequest),
//           let persistedValue = results.first {
//            //Then
//            XCTAssert(persistedValue.primary == "Australian Cattle Dog / Blue Heeler", "Mock pet breed was expected to be Australian Cattle Dog / Blue Heeler but was \(String(describing: persistedValue.primary))")
//        } else {
//            return XCTFail("No results or empty set returned from database")
//        }
//    }
//
//    func testPersistableCompoundField() throws {
//
//        //Given
//        let context = PersistenceController.shared.container.viewContext
//
//        let mockedAnimal = Animal.mock[1]
//        try context.save()
//        let fetchRequest = BreedEntity.fetchRequest()
//        if let results = try? context.fetch(fetchRequest),
//           let persistedValue = results.first {
//            print("found a breed")
//        }
//
//        @Persistable<Animal, AnimalEntity>(context: context) var pet: Animal?
//
//        pet = mockedAnimal
//
//        try context.save()
//
//        //When
//        let fetchRequest2 = AnimalEntity.fetchRequest()
//        if let results = try? context.fetch(fetchRequest2),
//           let persistedValue = results.first {
//            //Then
//            XCTAssert(persistedValue.name == "ID#A405763", "Mock pet name was expected to be ID#A405763 but was \(String(describing: persistedValue.name))")
//
//        } else {
//            return XCTFail("No results or empty set returned from database")
//        }
//    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
