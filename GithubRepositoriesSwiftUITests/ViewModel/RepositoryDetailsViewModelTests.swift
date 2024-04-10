//
//  RepositoryDetailsViewModelTests.swift
//  GithubRepositoriesSwiftUITests
//
//  Created by Jorge de Carvalho on 31/03/24.
//

@testable import GithubRepositoriesSwiftUI
import XCTest

final class RepositoryDetailsViewModelTests: XCTestCase {
    private var repositoryDouble: Repository = Repository.fixture()
    private lazy var sut: RepositoryDetailsViewModel = RepositoryDetailsViewModel(repository: repositoryDouble)

    override func setUp() {
    }

    override func tearDown() {
    }

    func test_should_return_true_when_description_exists() {
        // Given
        sut.repository.description = "Test Description"

        // When
        let showDescription = sut.showDescription()

        // Then
        XCTAssertTrue(showDescription)
    }

    func test_should_return_false_when_description_doesnt_exists() {
        // Given
        sut.repository.description = nil

        // When
        let showDescription = sut.showDescription()

        // Then
        XCTAssertFalse (showDescription)
    }

}
