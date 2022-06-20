//
// Created by Simon Rofe on 31/5/22.
//

import XCTest
@testable import PetSave

class PetSaveTests: XCTestCase {
    override func setUpWithError() throws {
        try super.setUpWithError()
    }

    override func tearDownWithError() throws {
        try super.tearDownWithError()
    }

    func testCreatePetWithSamplePetData() throws {
        guard let url = Bundle.main.url(forResource: "AnimalsMock", withExtension: "json"),
              let data = try? Data(contentsOf: url)
        else { return XCTFail("AnimalsMock file missing or data is corrupted") }
        let pets: [Animal]
        let container: AnimalsContainer
        do {
            let jsonDecoder = JSONDecoder()
            jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
            container = try jsonDecoder.decode(AnimalsContainer.self, from: data)
            pets = container.animals
        } catch {
            return XCTFail(error.localizedDescription)
        }
        let pet = try XCTUnwrap(pets.first)
        XCTAssert(pet.name == "Kiki", "Mock pet name was expected to be Kiki but was \(pet.name)")
    }

    func testPerformanceExample() throws {
        measure {
        }
    }
}
