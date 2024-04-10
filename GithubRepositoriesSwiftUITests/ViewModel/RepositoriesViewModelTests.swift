//
//  RepositoriesViewModelTests.swift
//  GithubRepositoriesSwiftUITests
//
//  Created by Jorge de Carvalho on 31/03/24.
//

@testable import GithubRepositoriesSwiftUI
import XCTest

final class RepositoriesViewModelTests: XCTestCase {
    private var webServiceSpy: WebServiceSpy?
    private var sut: RepositoriesViewModel?

    override func setUp() {
        webServiceSpy = WebServiceSpy()
        guard let webServiceSpy = webServiceSpy else {
            XCTFail("webServiceSpy must exists.")
            return
        }
        sut = RepositoriesViewModel(webService: webServiceSpy)
    }

    override func tearDown() {
        webServiceSpy = nil
        sut = nil
    }
    
    func test_webService_fetchData_must_be_called_when_fetchRepositories_is_called() {
        // Given
        guard let sut = sut else {
            XCTFail("sut must exists.")
            return
        }
        guard let webServiceSpy = webServiceSpy else {
            XCTFail("webServiceSpy must exists.")
            return
        }

        // When
        sut.fetchRepositories()

        // Then
        XCTAssertTrue(webServiceSpy.fetchDataFunctionCalled)
    }
    
    func test_webService_fetchData_must_return_passed_array_when_fetchRepositories_is_called() {
        // Given

        // When

        // Then

    }


}
