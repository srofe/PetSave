//
// Created by Simon Rofe on 31/5/22.
//

import XCTest
@testable import PetSave

class RequestManagerTests: XCTestCase {
    private var requestManager: RequestManagerProtocol?

    override func setUp() {
        super.setUp()
        guard let userDefaults = UserDefaults(suiteName: #file) else { return }
        userDefaults.removePersistentDomain(forName: #file)
        requestManager = RequestManagerMock(
            apiManager: APIManagerMock(),
            accessTokenManager: AccessTokenManager(userDefaults: userDefaults)
        )
    }

    func testRequestAnimals() async throws {
        guard let container: AnimalsContainer = try await requestManager?.perform(AnimalsRequestMock.getAnimals) else {
            XCTFail("Didn't get data from the request manager")
            return
        }

        let animals = container.animals
        let first = animals.first
        let last = animals.last

        XCTAssertEqual(first?.name, "Kiki")
        XCTAssertEqual(first?.age.rawValue, "Adult")
        XCTAssertEqual(first?.gender.rawValue, "Female")
        XCTAssertEqual(first?.size.rawValue, "Medium")
        XCTAssertEqual(first?.coat?.rawValue, "Short")

        XCTAssertEqual(last?.name, "Midnight")
        XCTAssertEqual(last?.age.rawValue, "Adult")
        XCTAssertEqual(last?.gender.rawValue, "Female")
        XCTAssertEqual(last?.size.rawValue, "Large")
        XCTAssertEqual(last?.coat, nil)
    }
}
