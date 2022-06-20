//
//  SearchViewModelTestCase.swift
//  PetSaveTests
//
//  Created by Simon Rofe on 20/6/2022.
//

import XCTest
@testable import PetSave

class SearchViewModelTestCase: XCTestCase {
    let testContext = PersistenceController.preview.container.viewContext
    var viewModel: SearchViewModel!

    override func setUp() {
        super.setUp()
        viewModel = SearchViewModel(
            animalSearcher: AnimalSearcherMock(),
            animalStore: AnimalStoreService(context: testContext)
        )
    }

    func testShouldFilterIsFalseForEmptyFilters() {
        XCTAssertTrue(viewModel.searchText.isEmpty)
        XCTAssertEqual(viewModel.ageSelection, .none)
        XCTAssertEqual(viewModel.typeSelection, .none)
        XCTAssertFalse(viewModel.shouldFilter)
    }

    func testShouldFilterIsTrueForSearchText() {
        viewModel.searchText = "Kiki"
        XCTAssertFalse(viewModel.searchText.isEmpty)
        XCTAssertEqual(viewModel.ageSelection, .none)
        XCTAssertEqual(viewModel.typeSelection, .none)
        XCTAssertTrue(viewModel.shouldFilter)
    }

    func testShouldFilterIsgrueForAgeFilter() {
        viewModel.ageSelection = .baby
        XCTAssertTrue(viewModel.searchText.isEmpty)
        XCTAssertEqual(viewModel.ageSelection, .baby)
        XCTAssertEqual(viewModel.typeSelection, .none)
        XCTAssertTrue(viewModel.shouldFilter)
    }
}
