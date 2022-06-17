//
// Created by Simon Rofe on 17/6/2022.
//

import XCTest
@testable import PetSave

@MainActor
class AnimalsNearYouViewModelTestCase: XCTestCase {
    let testContext = PersistenceController.preview.container.viewContext
    var viewModel: AnimalsNearYouViewModel!

    @MainActor
    override func setUp() {
        super.setUp()
        viewModel = AnimalsNearYouViewModel(
            isLoading: true,
            animalFetcher: AnimalsFetcherMock(),
            animalStore: AnimalStoreService(context: testContext)
        )
    }

    func testFetchAnimalsLoadingState() async {
        XCTAssertTrue(viewModel.isLoading, "The view model should be loading, but it isn't")
        await viewModel.fetchAnimals()
        XCTAssertFalse(viewModel.isLoading, "The view model shouldn't be loading, but it is")
    }

    func testUpdatePageFetchMoreAnaimals() async {
        XCTAssertEqual(viewModel.page, 1, "the view model's page property should be 1 before fetching, but it's \(viewModel.page)")
        await viewModel.fetchMoreAnimals()
        XCTAssertEqual(viewModel.page, 2, "the view model's page property should be 2 after fetching, but it's \(viewModel.page)")
    }
}
