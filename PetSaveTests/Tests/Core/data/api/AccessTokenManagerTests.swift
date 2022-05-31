//
//  AccessTokenManagerTests.swift
//  PetSaveTests
//
//  Created by Simon Rofe on 31/5/2022.
//

import XCTest
@testable import PetSave

class AccessTokenManagerTests: XCTestCase {
    private var accessTokenManager: AccessTokenManagerProtocol?
    let token = AccessTokenTestHelper.randomAPIToken()

    override func setUp() {
        super.setUp()
        guard let userDefaults = UserDefaults(suiteName: #file) else { return }
        userDefaults.removePersistentDomain(forName: #file)
        userDefaults.set(token.expiresAt.timeIntervalSince1970, forKey: AppUserDefaultsKeys.expiresAt)
        userDefaults.set(token.bearerAccessToken, forKey: AppUserDefaultsKeys.bearerAccessToken)
        accessTokenManager = AccessTokenManager(userDefaults: userDefaults)
    }

    func testRequestToken() {
        guard let token = accessTokenManager?.fetchToken() else {
            XCTFail("Didn't get token from the access token manager")
            return
        }
        XCTAssertFalse(token.isEmpty)
    }
}
